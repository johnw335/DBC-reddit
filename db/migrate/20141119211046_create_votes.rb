class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.belongs_to :comment
      t.boolean    :up
      t.timestamps
    end
  end
end
