json.array!(@myfiles) do |myfile|
  json.extract! myfile, :id, :name, :mydirectory_id
  json.url myfile_url(myfile, format: :json)
end
