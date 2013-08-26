class AdminController < ApplicationController
  before_filter :authenticate_organizer!
  
  def index
  end
end
