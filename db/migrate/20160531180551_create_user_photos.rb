class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.string :url
      t.string :likes

      t.timestamps null: false
    end
  end
end
