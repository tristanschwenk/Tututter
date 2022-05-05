json.user user
json.tweets user.tweets, partial: "tweets/tweet", as: :tweet
json.followed user.followed
json.following user.following