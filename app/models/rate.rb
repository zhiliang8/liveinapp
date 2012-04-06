# encoding: utf-8
class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true
  
  attr_accessible :user_status, :body
  
  after_create :popluate_stars
  
  def popluate_stars
    if self.stars.present?
      require 'json'
      json = JSON.parse(self.stars)
      
    end
  end
end
