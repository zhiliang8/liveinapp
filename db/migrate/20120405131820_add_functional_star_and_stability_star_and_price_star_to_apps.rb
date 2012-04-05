class AddFunctionalStarAndStabilityStarAndPriceStarToApps < ActiveRecord::Migration
  def change
    add_column :apps, :functional_star, :integer, :null => false, :default => 0

    add_column :apps, :stability_star, :integer, :null => false, :default => 0

    add_column :apps, :price_star, :integer, :null => false, :default => 0

  end
end
