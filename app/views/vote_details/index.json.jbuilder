json.array!(@vote_details) do |vote_detail|
  json.extract! vote_detail, :id
  json.url vote_detail_url(vote_detail, format: :json)
end
