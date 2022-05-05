class AddRetweetToTweet < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :is_retweet, :boolean
    add_column :tweets, :retweet_original_id, :integer
  end
end
