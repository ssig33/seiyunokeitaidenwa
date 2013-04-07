class AmebloImage < ActiveRecord::Base
  attr_accessible :image, :url
  require 'open-uri'
  def self.from_url url
    unless a = self.where(url: url).first
      alice = Mechanize.new
      page = alice.get url
      image = page.root.xpath("//div[@id='originalImgUrl']").text
      m = Magick::Image.from_blob(open(image).read).first
      m.format = 'PNG'
      img = gyazo m.to_blob
      a = self.find_or_create_by_url(url, image: img)
    end
    a.image
  end

private
  require 'net/http'
  HOST = 'gyazo.ssig33.com'
  CGI = '/upload'
  UA   = 'SeiyunoKeitaidenwa'
  def self.gyazo imagedata
    boundary = '----BOUNDARYBOUNDARY----'

    data = <<EOF
--#{boundary}\r
content-disposition: form-data; name="id"\r
\r
#{''}\r
--#{boundary}\r
content-disposition: form-data; name="imagedata"; filename="gyazo.com"\r
\r
#{imagedata}\r
--#{boundary}--\r
EOF

   header ={ 'Content-Length' => data.length.to_s, 'Content-type' => "multipart/form-data; boundary=#{boundary}", 'User-Agent' => UA }

    Net::HTTP.start(HOST,80){|http|
      res = http.post(CGI,data,header)
      return res.response.body
    }
  end
end
