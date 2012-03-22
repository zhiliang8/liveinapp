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
