class AddPricingUrlToApps < ActiveRecord::Migration
  def change
    add_column :apps, :pricing_url, :string

  end
end
