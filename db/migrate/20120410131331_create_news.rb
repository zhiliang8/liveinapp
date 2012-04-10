class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :link
      t.references :app
      t.references :user

      t.timestamps
    end
  end
end
