class Comment < ActiveRecord::Migration
  def change
    create_table Comment do |t|
      t.string :body
      t.belongs_to :user
      t.belongs_to :post
    end
  end
end
