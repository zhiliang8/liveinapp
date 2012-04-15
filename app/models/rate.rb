# encoding: utf-8
class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User", :counter_cache => :using_app_count
  belongs_to :user, :class_name => "User", :foreign_key => :rater_id
  belongs_to :app
  
  attr_accessible :user_status, :body
  
  default_scope where("user_status" => 0)
  scope :latest, order("created_at desc")
  
  after_create :popluate_stars
  
  # 计算总平均星数
  def popluate_stars
    body = []
    if self.stars.present?
      require 'json'
      stars_data = JSON.parse(self.stars)
      data = stars_data.map{|k,v| {"#{k}_star" => v.to_i}}.inject{|m, v| m.merge(v)}
      app = self.app
      score = app.rater_count.zero? ? 0 : app.overall_star/app.rater_count
      App.update_counters(app.id, data.merge({:rater_count => 1, :score => score}))
      stars_data.each do |k, v|
        body << "#{App::RATE_DIMENSIONS[k.to_sym]}: #{v}星 "
      end
    end
    if self.body.present?
      body << "---" << self.body
    end
    comment = Comment.new(:body => body.join)
    #评价评论 区别与普通的评论
    comment.votable = true
    comment.user = self.rater
    comment.app = self.app
    comment.save
  end

end
