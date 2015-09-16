class Follower < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "User_id"
end
