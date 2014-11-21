class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :post
  has_many :replies, class_name: "Comment"
  has_many :votes


  def net_votes
    votes = self.votes
    up_votes = votes.where(up: true).count
    down_votes = votes.where(up: false).count
    up_votes - down_votes
  end
end
