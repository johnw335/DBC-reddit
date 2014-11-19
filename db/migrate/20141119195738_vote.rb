class Vote < ActiveRecord::Migration
  def change
    create_table Comment do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.belongs_to :comment
    end
  end
end
