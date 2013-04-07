class ChangeTypeOnKeitaidenwas < ActiveRecord::Migration
  def change
    a = Keitaidenwa.all.map{|x| [x.id, x.seiyu_id.to_s] }
    remove_column :keitaidenwas, :seiyu_id
    add_column :keitaidenwas, :seiyu_id, :integer
    add_index :keitaidenwas, :seiyu_id
    a.each{|x| Keitaidenwa.find(x.first).update_attributes(seiyu_id: x.last)}
  end
end
