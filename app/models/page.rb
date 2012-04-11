class Page < ActiveRecord::Base
  validates_presence_of :slug, :title, :body
  validates_format_of :slug, :with => /^[a-z0-9\-_]+$/
  
  def body_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(self.body)    
  end
end
