json.array!(@swaps) do |swap|
  json.extract! swap, :id, :item1, :name, :description, :image, :time
  json.url swap_url(swap, format: :json)
end
