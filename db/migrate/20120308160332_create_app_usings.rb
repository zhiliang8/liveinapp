class CreateAppUsings < ActiveRecord::Migration
  def change
    create_table :app_usings do |t|
      t.references :app
      t.references :user

      t.timestamps
    end
  end
end
