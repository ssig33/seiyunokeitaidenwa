class Keitaidenwa < ActiveRecord::Base
  belongs_to :seiyu
  accepts_nested_attributes_for :seiyu
  attr_accessible :at, :phone, :seiyu_id, :url, :description
  has_one :tweet, primary_key: :url, foreign_key: :url
  validates_presence_of :at
  validates_presence_of :phone
  validates_presence_of :url
  before_save do
    true
  end

  def image?
    self.url.match(/jpg$|JPG$|png$|PNG$|jpeg$|JPEG/)
  end

  def tweet?
    self.url.match(/twitter\.com\/.*?\/\d+/)
  end

  def tweet
    Tweet.from_url self.url
  end
  
  def ameblo_image?
    self.url =~ /ameblo\.jp\/.*?\/image\-.*html/
  end

  def ameblo_image
    AmebloImage.from_url self.url
  end
end
