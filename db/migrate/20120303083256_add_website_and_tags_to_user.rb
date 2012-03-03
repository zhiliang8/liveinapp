class AddWebsiteAndTagsToUser < ActiveRecord::Migration
  def change
    add_column :users, :website, :string

    add_column :users, :tags, :string

  end
end
