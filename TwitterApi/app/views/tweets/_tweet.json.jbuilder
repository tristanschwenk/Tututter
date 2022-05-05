json.extract! tweet, :id, :content, :created_at, :likes
json.user tweet.user
if tweet.is_retweet
    json.is_retweet tweet.is_retweet
  json.retweet_original_tweet tweet.retweets, partial: "tweets/tweet", as: :tweet
end 