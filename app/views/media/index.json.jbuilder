json.array!(@media) do |medium|
  json.extract! medium, :snippet, :project_id
  json.url medium_url(medium, format: :json)
end
