class Node < ActiveRecord::Base
  # has_many :nodes, :class_name => 'Node', :foreign_key => 'parent_id', :dependent => :destroy
  # belongs_to :parent, :class_name => 'Node', :foreign_key => 'parent_id'
  acts_as_tree :order => "sort"
  has_many :apps
end
