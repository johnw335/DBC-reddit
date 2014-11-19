class Subreddit < ActiveRecord::Migration
  def change
    create_table Subreddit do |t|
      t.string :name
      t.belongs_to :user
      t.string :description
    end
  end
end
