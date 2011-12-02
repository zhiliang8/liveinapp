class AddParentToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :parent_id, :integer
  end
end
