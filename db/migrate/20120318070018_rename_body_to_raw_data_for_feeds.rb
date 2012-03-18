class RenameBodyToRawDataForFeeds < ActiveRecord::Migration
  def change
    rename_column :feeds, :body, :raw_data
  end

end
