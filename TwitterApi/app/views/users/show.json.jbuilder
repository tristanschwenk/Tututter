# json.user @user, :id, :firstname, :lastname, :username
# json.tweets @user.tweets, :id, :content, :likes, :user, :created_at
# json.followed @user.followed
# json.following @user.following

json.partial! partial: "users/user", collection: @user, as: :user
