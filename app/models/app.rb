# encoding: utf-8
class App < ActiveRecord::Base
  belongs_to :node, :counter_cache => true
  belongs_to :user
  validates :name, :presence => true
  validates :url, :presence => true, :format => {:with => /http:\/\/\w+/}, :uniqueness => true
  mount_uploader :logo, LogoUploader
  
  scope :approved, where(:status => '1')
end
