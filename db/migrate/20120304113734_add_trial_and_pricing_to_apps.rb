class AddTrialAndPricingToApps < ActiveRecord::Migration
  def change
    add_column :apps, :trial, :integer

    add_column :apps, :pricing, :text

  end
end
