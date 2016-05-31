class CreatePhotoTags < ActiveRecord::Migration
  def change
    create_table :photo_tags do |t|
      t.integer :inst_tag_id
      t.integer :user_photo_id

      t.timestamps null: false
    end
  end
end
