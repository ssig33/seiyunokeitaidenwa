class CreateKeitaidenwas < ActiveRecord::Migration
  def change
    create_table :keitaidenwas do |t|
      t.string :seiyu_id
      t.string :phone
      t.string :url
      t.date :at
      t.timestamps
    end
    add_index :keitaidenwas, :seiyu_id
    add_index :keitaidenwas, :phone
  end
end
