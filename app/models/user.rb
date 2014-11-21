class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :subreddits, through: :subscriptions
  has_many :votes
  has_many :comments
  has_many :posts

  has_secure_password
  # attr_accessible :email, :password, :password_confirmation, :password_digest
end
