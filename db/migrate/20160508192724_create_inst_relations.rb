class CreateInstRelations < ActiveRecord::Migration
  def change
    create_table :inst_relations do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
      add_index :inst_relations, :followed_id
      add_index :inst_relations, :follower_id
      add_index :inst_relations, [:follower_id, :followed_id], unique: true
  end
end
