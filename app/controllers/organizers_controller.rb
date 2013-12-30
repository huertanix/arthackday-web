class OrganizersController < ApplicationController
  before_action :set_organizer, only: [:edit, :update]
  before_filter :authenticate_organizer!, :only => [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @organizer.update_without_password(params[:organizer])
        format.html { redirect_to root_url, flash[:notice] = SUCCESSFUL_REGISTRATION_UPDATE_MSG }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_organizer
    if current_organizer.org_admin?
      @organizer = Organizer.find(params[:id])
    else
      redirect_to '/admin', alert: "Access Denied! Cyberpolice have been alerted."
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organizer_params
    params.require(:organizer).permit(:name, :email, {:event_ids => []})
  end
end