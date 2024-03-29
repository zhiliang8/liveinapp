class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :app
      t.references :user
      t.text :body

      t.timestamps
    end
    add_index :comments, :app_id
    add_index :comments, :user_id
  end
end
