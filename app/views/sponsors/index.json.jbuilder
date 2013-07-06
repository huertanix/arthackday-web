json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :name, :website, :logo_uri
  json.url sponsor_url(sponsor, format: :json)
end
