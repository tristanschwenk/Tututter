if user_signed_in?
    json.user do
      json.(current_user, :id, :email, :firstname, :lastname, :username)
      json.user current_user, :id, :firstname, :lastname, :username
      json.tweets current_user.tweets, :id, :content, :likes, :user, :created_at
      json.followed current_user.followed
      json.following current_user.following
    end
  end