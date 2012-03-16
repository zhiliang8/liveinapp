class AddActionToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :action, :string

  end
end
