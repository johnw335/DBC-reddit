class Subreddit < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :posts
  belongs_to :moderator, class_name: "User", foreign_key: "user_id"

  validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :moderator, presence: true

end
