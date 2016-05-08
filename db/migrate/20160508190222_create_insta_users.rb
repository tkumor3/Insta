class CreateInstaUsers < ActiveRecord::Migration
  def change
    create_table :insta_users do |t|
      t.string :username
      t.string :ins_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
