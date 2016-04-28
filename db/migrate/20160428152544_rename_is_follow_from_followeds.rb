class RenameIsFollowFromFolloweds < ActiveRecord::Migration
  def change
    rename_column :followeds, :isFollow, :is_follow
  end
end
