class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :username
      t.string :ins_id
      t.boolean :toFollows
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
