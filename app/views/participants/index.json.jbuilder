json.array!(@participants) do |participant|
  json.extract! participant, :name, :bio, :twitter_handle, :website
  json.url participant_url(participant, format: :json)
end
