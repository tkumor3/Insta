#Add Photo to Instagram User
#
class AddLastPhotoToInstaUsers < ActiveRecord::Migration
  def change
    add_column :insta_users, :last_photo, :string, default: 0
  end
end
