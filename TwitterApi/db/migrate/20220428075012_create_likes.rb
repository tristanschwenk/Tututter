class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :userId
      t.string :tweetId

      t.timestamps
    end
  end
end
