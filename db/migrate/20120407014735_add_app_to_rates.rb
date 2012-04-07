class AddAppToRates < ActiveRecord::Migration
  def change
    add_column :rates, :app_id, :integer
    remove_column :rates, :rateable_id
    remove_column :rates, :rateable_type
  end
end
