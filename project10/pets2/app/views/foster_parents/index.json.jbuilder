json.array!(@foster_parents) do |foster_parent|
  json.extract! foster_parent, :id, :name, :address, :email
  json.url foster_parent_url(foster_parent, format: :json)
end
