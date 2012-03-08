class AddVersionsToApps < ActiveRecord::Migration
  def change
    add_column :apps, :versions, :string

  end
end
