class HomeController < ApplicationController
  def index
    @events = Event.all.sorted_by_date
  end
end
