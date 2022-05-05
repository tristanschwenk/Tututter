class Tweet < ApplicationRecord

    belongs_to :user
    has_many :likes
    belongs_to :retweets, class_name: "Tweet", foreign_key: "retweet_original_id", optional: true
end
