class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, :class_name => "User"
  scope :find_followers, ->(user_id) { where(:user_id => user_id)}
  #scope :find_nonfollowers, ->(user_id) { where.not(user_id: [user_id])}
  #scope :find_nonfollowers, ->(user_id) { where(user_id: [user_id])}
end
