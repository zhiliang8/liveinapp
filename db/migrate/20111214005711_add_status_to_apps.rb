class AddStatusToApps < ActiveRecord::Migration
  def change
    add_column :apps, :status, :string, :default => '0'
  end
end
