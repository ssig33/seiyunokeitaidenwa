class Tweet
  def self.from_url url
    Twitter.configure do |config|
      config.consumer_key = 'impmSZo4SIXnR1p8Jp9bQ'
      config.consumer_secret = 'dikuqRIHNqMWRI3PKTOeJU5YjVCTRAzu0VzmEWdVKA'
      config.oauth_token = ENV['AdminToken']
      config.oauth_token_secret = ENV['AdminSecret']
    end
    Twitter.status(url.split('/').last)
  end
end
