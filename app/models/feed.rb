# coding:utf-8
class Feed < ActiveRecord::Base
  
  belongs_to :user
  
  # 解析feed-data
  def data
    data = FeedData.parse(self.raw_data)
  end
end
