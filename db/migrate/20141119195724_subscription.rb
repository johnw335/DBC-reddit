class Subscription < ActiveRecord::Migration
  def change
    create_table Subscription do |t|
      t.belongs_to :user
      t.belongs_to :subreddit
    end
  end
end
