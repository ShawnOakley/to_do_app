class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :project_id

      t.timestamps
    end
    add_index :items, :project_id
  end
end
