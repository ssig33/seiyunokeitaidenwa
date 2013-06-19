class Tweet < ActiveRecord::Base
  validates_presence_of :url
  validates_uniqueness_of :url

  def self.from_url url
    if t = self.where(url: url).first
      JSON.parse t.json
    else
      Twitter.configure do |config|
        config.consumer_key = 'impmSZo4SIXnR1p8Jp9bQ'
        config.consumer_secret = 'dikuqRIHNqMWRI3PKTOeJU5YjVCTRAzu0VzmEWdVKA'
        config.oauth_token = ENV['AdminToken']
        config.oauth_token_secret = ENV['AdminSecret']
      end
      json = Twitter.status(url.split('/').last).to_json
      self.find_or_create_by_url(url).update_attributes(json: json)
      JSON.parse(json)
    end
  end
end
