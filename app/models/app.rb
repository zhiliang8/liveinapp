# encoding: utf-8
class App < ActiveRecord::Base
  belongs_to :node, :counter_cache => true
  belongs_to :user, :counter_cache => true
  has_many :app_usings
  has_many :users, :through => :app_usings
  has_many :comments
  
  attr_protected :status, :using_user_count, :comments_count
  validates :name, :presence => true
  validates :url, :presence => true, :format => {:with => /http:\/\/\w+/}, :uniqueness => true
  mount_uploader :logo, LogoUploader
  
  scope :latest, order("created_at DESC")
  # scope :approved, where(:status => '1')
  
  
end
