class AddOverallStarToApps < ActiveRecord::Migration
  def change
    add_column :apps, :overall_star, :integer, :null => false, :default => 0

  end
end
