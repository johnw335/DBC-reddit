class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :subreddit
  has_many :votes
  has_many :comments

  #Counts the total net votes
  def net_votes
    votes = self.votes
    up_votes = votes.where(up: true).count
    down_votes = votes.where(up: false).count
    up_votes - down_votes
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
    end
  end

end
