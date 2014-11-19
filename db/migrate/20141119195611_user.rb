class User < ActiveRecord::Migration
  def change
    create_table User do |t|
      t.string :email
      t.string :username
      t.string :cohort
      t.string :password_hash
    end
  end
end
