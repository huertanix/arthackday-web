class PressBlurbsController < ApplicationController
  before_action :set_press_blurb, only: [:show, :edit, :update, :destroy]

  # GET /press_blurbs
  # GET /press_blurbs.json
  def index
    @press_blurbs = PressBlurb.all
  end

  # GET /press_blurbs/1
  # GET /press_blurbs/1.json
  def show
  end

  # GET /press_blurbs/new
  def new
    @press_blurb = PressBlurb.new
  end

  # GET /press_blurbs/1/edit
  def edit
  end

  # POST /press_blurbs
  # POST /press_blurbs.json
  def create
    @press_blurb = PressBlurb.new(press_blurb_params)

    respond_to do |format|
      if @press_blurb.save
        format.html { redirect_to @press_blurb, notice: 'Press blurb was successfully created.' }
        format.json { render action: 'show', status: :created, location: @press_blurb }
      else
        format.html { render action: 'new' }
        format.json { render json: @press_blurb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /press_blurbs/1
  # PATCH/PUT /press_blurbs/1.json
  def update
    respond_to do |format|
      if @press_blurb.update(press_blurb_params)
        format.html { redirect_to @press_blurb, notice: 'Press blurb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @press_blurb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_blurbs/1
  # DELETE /press_blurbs/1.json
  def destroy
    @press_blurb.destroy
    respond_to do |format|
      format.html { redirect_to press_blurbs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press_blurb
      @press_blurb = PressBlurb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def press_blurb_params
      params.require(:press_blurb).permit(:headline, :source_name, :source_url, :logo_uri, :featured)
    end
end
