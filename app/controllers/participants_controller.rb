class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :filter_events, only: [:create, :update]
  before_filter :authenticate_organizer!, :only => [:create, :update, :new, :edit, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    #participant_params[:event_ids] ||= []

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @participant }
      else
        format.html { render action: 'new' }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_participant
    @participant = Participant.find(params[:id])
    #@participant.events = Event.find(params[:event_ids]) if params[:event_ids]
  end

  # Don't allow assignment to an event the admin has no privileges for
  def filter_events
    # Allow previous event assignments
    current_event_ids = (@participant.nil? ? Set.new : @participant.event_ids.to_set)
    # No idea why there's always a blank event being sent. ugh
    params[:participant][:event_ids].reject!(&:empty?)
    # Need to_i to convert strings to ints
    new_event_ids = params[:participant][:event_ids].map(&:to_i).to_set

    # Failed attempt at elegance
    events_to_add = new_event_ids - current_event_ids
    #logger.debug "TO ADD EVENT ids: #{events_to_add.to_a}"
    events_to_remove = current_event_ids - new_event_ids
    #logger.debug "TO REMOVE EVENT ids: #{events_to_remove.to_a}"

    events_to_add.each do |event_id|
      if current_organizer.can_edit_event? event_id
        current_event_ids = current_event_ids.add(event_id.to_i) #unless event_id.empty?
      end
    end

    events_to_remove.each do |event_id|
      if current_organizer.can_edit_event? event_id
        current_event_ids = current_event_ids.delete(event_id.to_i) #unless event_id.empty?
      end
    end

    #logger.debug "SAVED EVENT ids: #{current_event_ids.to_a}"
    params[:participant][:event_ids] = current_event_ids.to_a
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def participant_params
    params.require(:participant).permit(:name, :email, :bio, :twitter_handle, :website, :photo_url, {:event_ids => []})
  end
end
