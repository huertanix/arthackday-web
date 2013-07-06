json.array!(@events) do |event|
  json.extract! event, :city, :theme, :hackathon_start, :hackathon_end, :show_start, :show_end, :about, :hack_rsvp_url, :show_rsvp_url
  json.url event_url(event, format: :json)
end
