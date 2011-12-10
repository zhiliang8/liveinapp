class AddAppCountToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :apps_count, :integer
  end
end
