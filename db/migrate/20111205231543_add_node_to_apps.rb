class AddNodeToApps < ActiveRecord::Migration
  def change
    add_column :apps, :node_id, :integer
  end
end
