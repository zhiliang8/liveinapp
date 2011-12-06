class AddUserToApps < ActiveRecord::Migration
  def change
    add_column :apps, :user_id, :integer
    add_column :apps, :user_name, :string
    add_column :apps, :node_name, :string
  end
end
