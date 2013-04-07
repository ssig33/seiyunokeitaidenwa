class CreateSeiyus < ActiveRecord::Migration
  def change
    create_table :seiyus do |t|
      t.string :name
      t.string :image
      t.string :url
      t.timestamps
    end
    add_index :seiyus, :name
  end
end
