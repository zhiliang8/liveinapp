class Node < ActiveRecord::Base
  has_many :nodes, :class_name => 'Node'
  belongs_to :parent, :class_name => 'Node', :foreign_key => 'parent_id'
end
