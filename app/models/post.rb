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

  def self.search(query)
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end

  def resize_image
    self.image_url
  end

  def how_old
    minutes = ((Time.now - self.created_at)/60).floor
    if minutes >= 60
      hours = (minutes/60).floor
      return "#{hours} #{'hour'.pluralize(hours)}"
    else
      return "#{minutes} #{'minute'.pluralize(minutes)}"
    end
  end
end
