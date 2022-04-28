json.extract! tweet, :id, :content, :authorId, :like, :creationDate, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
