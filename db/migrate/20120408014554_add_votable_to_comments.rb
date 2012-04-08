class AddVotableToComments < ActiveRecord::Migration
  def change
    add_column :comments, :votable, :boolean, :default => false
  end
end
