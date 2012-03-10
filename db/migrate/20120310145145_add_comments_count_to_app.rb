class AddCommentsCountToApp < ActiveRecord::Migration
  def change
    add_column :apps, :comments_count, :integer, :default => 0

  end
end
