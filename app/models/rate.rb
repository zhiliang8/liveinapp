# encoding: utf-8
class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :app
  
  attr_accessible :user_status, :body
  
  default_scope where("user_status" => 0)
  after_create :popluate_stars
  
  # 计算总平均星数
  def popluate_stars
    if self.stars.present?
      require 'json'
      stars_data = JSON.parse(self.stars)
      data = stars_data.map{|k,v| {"#{k}_star" => v.to_i}}.inject{|m, v| m.merge(v)}
      App.update_counters(self.app.id, data.merge({:rater_count => 1}))
    end
  end

end
