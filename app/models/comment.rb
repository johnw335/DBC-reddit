class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :post
  has_many :votes
end
