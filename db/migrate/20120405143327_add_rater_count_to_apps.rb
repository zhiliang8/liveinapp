class AddRaterCountToApps < ActiveRecord::Migration
  def change
    add_column :apps, :rater_count, :integer, :null => false, :default => 0

  end
end
