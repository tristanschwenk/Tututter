# json.array! @tweets do |tweet|
#     json.id tweet.id 
#     json.content tweet.content
#     json.user_id tweet.user_id
#     json.user tweet.user 
#     json.created_at tweet.created_at
#     json.likes tweet.likes

#     if tweet.is_retweet
#         json.is_retweet tweet.is_retweet
#         json.retweet_original_tweet tweet.retweets 
#     end
# end

json.array! @tweets, partial: "tweets/tweet", as: :tweet