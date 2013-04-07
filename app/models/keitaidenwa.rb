class Keitaidenwa < ActiveRecord::Base
  belongs_to :seiyu
  accepts_nested_attributes_for :seiyu
  attr_accessible :at, :phone, :seiyu_id, :url
  before_save do
    true
  end

  def image?
    self.url.match(/jpg$|JPG$|png$|PNG$|jpeg$|JPEG/)
  end
end
