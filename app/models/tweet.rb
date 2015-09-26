class Tweet < ActiveRecord::Base
  belongs_to :user
  scope :find_follower_tweets, ->(followers_ids) {where(user_id: [followers_ids])}
end
