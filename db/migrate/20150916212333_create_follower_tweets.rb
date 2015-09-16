class CreateFollowerTweets < ActiveRecord::Migration
  def change
    create_table :follower_tweets do |t|
      t.references :tweet
      t.references :follow
      t.timestamps null: false
    end
  end
end
