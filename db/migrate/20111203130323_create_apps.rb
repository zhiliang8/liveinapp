class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :url
      t.string :desc

      t.timestamps
    end
  end
end
