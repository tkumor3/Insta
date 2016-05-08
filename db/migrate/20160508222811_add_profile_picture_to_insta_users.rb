class AddProfilePictureToInstaUsers < ActiveRecord::Migration
  def change
    add_column :insta_users, :profile_picture, :string
  end
end
