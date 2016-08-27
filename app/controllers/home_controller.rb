class HomeController < ApplicationController
  def index
    @events = Event.all.sorted_by_date

    @future_events = Array.new

    @events.map { |event| @future_events.push event unless event.show_end < Date.new }
  end
end
