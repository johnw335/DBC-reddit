class Subreddit < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :posts
  belongs_to :moderator, class_name: "User", foreign_key: "user_id"

  validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :moderator, presence: true



  #will return an array of the user objects who subscribe to a subreddit
  def followers_of_subreddit
    followers_of_sub = []
    @subscriptions_to_sub = Subscription.where(subreddit: self)

    @subscriptions_to_sub.each do |subscription|
     followers_of_sub << subscription.user
    end
    followers_of_sub
  end

  #unfinished but is taking the followers of the subreddit and seeing what else they like. Logic not complete
  def most_similar_sub
    followers_other_subs = []
    followers_array = followers_of_subreddit

    # followers_array.each do |user|
    #   followers_other_subs << user.subscriptions.subreddit
    # end
    # followers_other_subs
  end

end
