json.array!(@swaps) do |swap|
  json.extract! swap, :id, :orig_name, :orig_desc, :orig_image, :swap_name, :swap_desc, :swap_image, :time
  json.url swap_url(swap, format: :json)
end
