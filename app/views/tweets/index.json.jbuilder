json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :message
  json.url tweet_url(tweet, format: :json)
end
