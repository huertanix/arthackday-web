json.array!(@press_blurbs) do |press_blurb|
  json.extract! press_blurb, :headline, :source_name, :source_url, :logo_uri
  json.url press_blurb_url(press_blurb, format: :json)
end
