class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :subreddit
  has_many :votes
  has_many :comments
end
