class Post < ActiveRecord::Migration
  def change
    create_table Post do |t|
      t.string :title
      t.string :body
      t.belongs_to :user
      t.belongs_to :subreddit
    end
  end
end
