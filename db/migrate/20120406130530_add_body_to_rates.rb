class AddBodyToRates < ActiveRecord::Migration
  def change
    add_column :rates, :body, :text
    
  end
end
