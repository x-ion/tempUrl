json.array!(@urls) do |url|
  json.extract! url, :id, :alias, :http, :UUID, :user_id
  json.url url_url(url, format: :json)
end
