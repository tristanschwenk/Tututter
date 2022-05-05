class Follow < ApplicationRecord
    has_many :followed, class_name: "User", foreign_key: "followed_id"
    has_many :following, class_name: "User", foreign_key: "following_id"
end
