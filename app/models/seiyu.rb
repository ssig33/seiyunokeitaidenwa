#coding:utf-8
class Seiyu < ActiveRecord::Base
  has_many :keitaidenwas
  attr_accessible :image, :name, :url
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_param
    self.name
  end

  def kankaku
    if self.keitaidenwas.select('distinct phone').count < 2
      '登録されている情報が少なく算出不可能'
    else
      ary = self.keitaidenwas.select('distinct phone').map{|x| self.keitaidenwas.where(phone: x.phone).order('id asc').first}.sort{|a,b| a.at <=> b.at}
      " #{((ary.last.at - ary.first.at)/ary.count).to_i} 日"
    end
  end
end
