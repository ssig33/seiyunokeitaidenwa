class AddIndexOnKeitaidenwas < ActiveRecord::Migration
  def change
    add_index :keitaidenwas, :at
  end
end
