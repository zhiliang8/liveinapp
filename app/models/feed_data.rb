# coding:utf-8
require 'json'
class FeedData
  
  def self.parse(raw_data)
    json = JSON.parse(raw_data)
    json.each do |k, v|
      
      self.class_eval <<-RUBY
        def #{k}
          "#{v}"
        end
      RUBY
    end
    FeedData.new
  end
end
str = "{\"user_name\":\"user1\", \"user_email\":\"user1@example.com\"}"
data = FeedData.parse(str)
puts data.user_name

str = "{\"user_name\":\"user2\", \"user_email\":\"user1@example.com\"}"
data = FeedData.parse(str)
puts data.user_name