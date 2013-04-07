class CreateAmebloImages < ActiveRecord::Migration
  def change
    create_table :ameblo_images do |t|
      t.string :url
      t.string :image

      t.timestamps
    end
    add_index :ameblo_images, :url
  end
end
