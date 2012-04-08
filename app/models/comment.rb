class Comment < ActiveRecord::Base
  belongs_to :app, :counter_cache => true
  belongs_to :user
  
  attr_accessible :body
  validates :body, :presence => true
  
  default_scope order("created_at desc")
  
  def bodys
    if self.votable
      self.body.scan(/(.+)\s*---\s*(.+)/).flatten
    else
      [self.body]
    end
  end
end
