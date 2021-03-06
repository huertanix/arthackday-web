class HomeController < ApplicationController
  def index
    @events = Event.all.sorted_by_date

    @future_events = Array.new

    @events.each do |event| 
      @future_events.push event unless event.show_end < Date.today 
    end

    if @future_events.empty? 
    	@future_events.push @events.first unless @events.empty?
    end

    #logger.debug "Earliest event in future: #{@future_events.last.theme}"
  end
end
