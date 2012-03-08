class Node < ActiveRecord::Base
  # has_many :nodes, :class_name => 'Node', :foreign_key => 'parent_id', :dependent => :destroy
  # belongs_to :parent, :class_name => 'Node', :foreign_key => 'parent_id'
  acts_as_tree :order => "sort"
  has_many :apps
  
  scope :hots, order("apps_count desc")
  
  def all_apps
    if self.leaf?
      self.apps
    else
      App.where(:node_id => self.childless)
    end
  end
  
  def self.hot_node_collection
    Node.hots.collect { |n| [n.name,n.id] }
  end
end
