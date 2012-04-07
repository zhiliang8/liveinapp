# coding:utf-8
class Feed < ActiveRecord::Base
  
  belongs_to :user
  default_scope order("created_at desc")
  # 解析feed-data
  def data
    JSON.parse(raw_data)
  end
end
