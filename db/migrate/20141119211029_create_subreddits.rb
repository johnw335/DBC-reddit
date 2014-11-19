class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.string :name
      t.belongs_to :user
      t.string :description
      t.timestamps
    end
  end
end
