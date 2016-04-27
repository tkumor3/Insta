class AddIsFollowToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :is_follow, :boolean, default: true
  end
end
