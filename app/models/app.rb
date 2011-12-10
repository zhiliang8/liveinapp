class App < ActiveRecord::Base
  belongs_to :node, :counter_cache => true
  belongs_to :user
  validates :url, :presence => true
end
