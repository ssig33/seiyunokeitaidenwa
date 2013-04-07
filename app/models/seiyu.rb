class Seiyu < ActiveRecord::Base
  has_many :keitaidenwas
  attr_accessible :image, :name, :url
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_param
    self.name
  end
end
