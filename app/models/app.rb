# encoding: utf-8
class App < ActiveRecord::Base
  
  paginates_per 10
  
  belongs_to :node, :counter_cache => true
  belongs_to :user, :counter_cache => true
  has_many :app_usings
  has_many :users, :through => :rates, :source => :rater
  has_many :comments
  has_many :rates
  has_many :news
  
  attr_protected :status, :using_user_count, :comments_count
  validates :name, :presence => true
  validates :url, :presence => true, :format => {:with => /http:\/\/\w+/}, :uniqueness => true
  mount_uploader :logo, LogoUploader
  
  # 最新添加
  scope :recent, order("created_at DESC")
  # 最新更新
  scope :recent_update, order("updated_at DESC, created_at DESC")
  # 最多用户使用
  scope :hot_use, order("rater_count DESC, created_at DESC")
  # 评价最高
  scope :hot_rate, order("score DESC, created_at DESC")
  
  # scope :approved, where(:status => '1')
  
  # 评价项
  RATE_DIMENSIONS = {:overall => '总评', :functional => '功能性', :stability => '稳定性', :price => '价格'}
  
  def created_by(user)
    self.user == user
  end

  def ratings
    
    RATE_DIMENSIONS
  end

  before_save do |app|
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    app.desc_html = markdown.render(app.desc) if app.desc.present?
    app.pricing_html = markdown.render(app.pricing) if app.pricing.present?
  end
  
end
