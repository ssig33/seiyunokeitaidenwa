class ChangeTypeOnKeitaidenwas < ActiveRecord::Migration
  def change
    change_column :keitaidenwas, :seiyu_id, :integer
  end
end
