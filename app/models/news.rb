class News < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  attr_accessible :title, :link
  validates :title, :presence => true
  validates :link, :presence => true, :format => {:with => /http:\/\/\w+/}
  default_scope order('created_at desc')
end
