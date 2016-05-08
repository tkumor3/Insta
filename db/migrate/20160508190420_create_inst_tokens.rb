class CreateInstTokens < ActiveRecord::Migration
  def change
    create_table :inst_tokens do |t|
      t.string :access_token
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
