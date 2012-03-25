class AddDescHtmlAndPricingHtmlToApps < ActiveRecord::Migration
  def change
    add_column :apps, :desc_html, :text

    add_column :apps, :pricing_html, :text

  end
end
