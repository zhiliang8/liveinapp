class AddScoreToApps < ActiveRecord::Migration
  def change
    add_column :apps, :score, :decimal, :precision => 2, :scale => 1

  end
end
