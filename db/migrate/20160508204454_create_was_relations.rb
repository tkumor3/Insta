class CreateWasRelations < ActiveRecord::Migration
  def change
    create_table :was_relations do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :was_relations, :followed_id
    add_index :was_relations, :follower_id
    add_index :was_relations, [:follower_id, :followed_id], unique: true
  end
end
