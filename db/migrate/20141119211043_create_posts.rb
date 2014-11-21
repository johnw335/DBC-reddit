class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.belongs_to :user
      t.belongs_to :subreddit
      t.integer :points, default: 0
      t.timestamps
    end
  end
end
