class Cache < ActiveRecord::Base
  attr_accessible :body, :key, :expire_at

  def self.set key, value, expire_at = 60
    self.find_or_create_by_key(key).update_attributes(body: value, expire_at: Time.now+expire_at)
  end

  def self.get key
    c = self.where(key: key).first
    if c
      if c.expire_at > Time.now
        c.body
      else
        c.destroy
        nil
      end
    else
      nil
    end
  end
end
