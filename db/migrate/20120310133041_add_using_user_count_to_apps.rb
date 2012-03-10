class AddUsingUserCountToApps < ActiveRecord::Migration
  def change
    add_column :apps, :using_user_count, :integer, :default => 0

  end
end
