json.array!(@ip_lists) do |ip_list|
  json.extract! ip_list, :id
  json.url ip_list_url(ip_list, format: :json)
end
