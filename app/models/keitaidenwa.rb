class Keitaidenwa < ActiveRecord::Base
  belongs_to :seiyu
  accepts_nested_attributes_for :seiyu
  attr_accessible :at, :phone, :seiyu_id, :url
  has_one :tweet, primary_key: :url, foreign_key: :url
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

end
