#User Tag
class CreateTagRelations < ActiveRecord::Migration
  def change
    create_table :tag_relations do |t|
      t.integer :insta_user_id
      t.integer :inst_tag_id
      t.integer :counter, default: 0

      t.timestamps null: false
    end
      add_index :tag_relations, :insta_user_id
      add_index :tag_relations, :inst_tag_id
      add_index :tag_relations, [:insta_user_id, :inst_tag_id], unique: true
  end
end
