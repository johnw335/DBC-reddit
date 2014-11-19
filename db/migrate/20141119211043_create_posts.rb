class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.belongs_to :user
      t.belongs_to :subreddit
      t.timestamps
    end
  end
end
