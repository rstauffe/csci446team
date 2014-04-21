json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :image, :is_used
  json.url item_url(item, format: :json)
end
