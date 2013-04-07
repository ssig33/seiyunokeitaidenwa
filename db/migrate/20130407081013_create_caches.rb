class CreateCaches < ActiveRecord::Migration
  def change
    create_table :caches do |t|
      t.string :key
      t.text :body
      t.datetime :expire_at
      t.timestamps
    end
    add_index :caches, :key
  end
end
