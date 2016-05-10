class CreateInstTags < ActiveRecord::Migration
  def change
    create_table :inst_tags do |t|
      t.string :name
      t.integer :media_count

      t.timestamps null: false
    end
  end
end
