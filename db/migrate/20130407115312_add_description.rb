class AddDescription < ActiveRecord::Migration
  def up
    add_column :keitaidenwas, :description, :text
  end
end
