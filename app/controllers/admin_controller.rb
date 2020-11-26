class AdminController < ApplicationController
  before_action :authenticate_organizer!
  
  def index
  end
end
