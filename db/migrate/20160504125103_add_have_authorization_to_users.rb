class AddHaveAuthorizationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :have_authorization, :boolean, default: false
  end
end
