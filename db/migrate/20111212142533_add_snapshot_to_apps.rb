class AddSnapshotToApps < ActiveRecord::Migration
  def change
    add_column :apps, :snapshot, :String
  end
end
