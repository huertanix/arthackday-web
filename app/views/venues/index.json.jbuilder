json.array!(@venues) do |venue|
  json.extract! venue, :name, :address, :city, :subdivision, :country, :postal_code, :website
  json.url venue_url(venue, format: :json)
end
