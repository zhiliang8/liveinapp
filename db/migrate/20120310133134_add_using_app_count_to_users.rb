class AddUsingAppCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :using_app_count, :integer, :default => 0

  end
end
