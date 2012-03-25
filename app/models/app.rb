# encoding: utf-8
class App < ActiveRecord::Base
  
  paginates_per 10
  
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
  
  def created_by(user)
    self.user == user
  end
    
  before_save do |app|
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    app.desc_html = markdown.render(app.desc) if app.desc.present?
    app.pricing_html = markdown.render(app.pricing) if app.pricing.present?
  end
  
end
