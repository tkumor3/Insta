class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.integer :user_id
      t.string :acces_token
      t.string :id_ins
      t.string :name

      t.timestamps null: false
    end
  end
end
