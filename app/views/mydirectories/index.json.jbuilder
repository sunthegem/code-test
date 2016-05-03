json.array!(@mydirectories) do |mydirectory|
  json.extract! mydirectory, :id, :name, :mydirectory_id
  json.url mydirectory_url(mydirectory, format: :json)
end
