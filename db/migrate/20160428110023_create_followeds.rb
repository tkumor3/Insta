class CreateFolloweds < ActiveRecord::Migration
  def change
    create_table :followeds do |t|
      t.string :username
      t.string :ins_id
      t.boolean :isFollow, default: true
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
