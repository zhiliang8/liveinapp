class RemoveSnapshotFromApps < ActiveRecord::Migration
  def up
    change_table :apps do |t|
      t.remove :snapshot
      t.string :logo
    end
  end

  def down
    change_table :apps do |t|
      t.remove :logo
      t.string :snapshot
    end
  end
end
