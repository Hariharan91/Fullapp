json.array!(@posts) do |post|
  json.extract! post, :title, :model_id
  json.url post_url(post, format: :json)
end