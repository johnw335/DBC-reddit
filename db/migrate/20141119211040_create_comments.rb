class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :user
      t.belongs_to :post
      t.belongs_to :comment
      t.integer :points, default: 0
      t.timestamps
    end
  end
end
