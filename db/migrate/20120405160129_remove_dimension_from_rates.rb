class RemoveDimensionFromRates < ActiveRecord::Migration
  def change
    change_table :rates do |t|
      t.remove :dimension
      t.change :stars, :string
      t.integer :user_status
    end
  end
end
