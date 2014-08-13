class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :filter_event, only: [:create, :update]
  before_filter :authenticate_organizer!, :only => [:index, :create, :update, :new, :edit, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.friendly.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private

  # Don't allow assignment to an event the admin has no privileges for
  def filter_event
    current_event_id = (@project.nil? ? nil : @project.event_id)
    new_event_id = params[:project][:event_id].to_i

    if !current_organizer.can_edit_event? new_event_id
      # Make validation fail if this is a new project, otherwise revert to previous event selection
      params[:project][:event_id] = (current_event_id.blank? ? nil : current_event_id) 
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    # support ye olde website URLs and future project ids
    if params[:id] =~ /^\d{1,6}/
      @project = Project.find(params[:id])
    else
      @project = Project.friendly.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :description, :tag, :website, :github, :event_id, :featured_thumbnail, {:participant_ids => []}, :medium_attributes => [:id, :snippet, :project_id, :_destroy], :photos_attributes => [:id, :image, :credit, :project_id, :_destroy])
  end
end