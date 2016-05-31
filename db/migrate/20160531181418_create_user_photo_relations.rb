class CreateUserPhotoRelations < ActiveRecord::Migration
  def change
    create_table :user_photo_relations do |t|
      t.integer :insta_user_id
      t.integer :user_photo_id

      t.timestamps null: false
    end
  end
end
