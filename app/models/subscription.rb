class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subreddit

  validates_uniqueness_of :user_id, scope: :subreddit_id, message: "You are already subscribed to that subreddit"
end
