json.array!(@organizers) do |organizer|
  json.extract! organizer, :email
  json.url organizer_url(organizer, format: :json)
end