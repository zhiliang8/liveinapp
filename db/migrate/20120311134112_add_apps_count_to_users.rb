class AddAppsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apps_count, :integer, :default => 0

  end
end
