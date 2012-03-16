class AppUsing < ActiveRecord::Base
  belongs_to :app, :counter_cache => :using_user_count
  belongs_to :user, :counter_cache => :using_app_count
  attr_protected :app_id, :user_id, :created_at, :updated_at
  
  scope :latest, order("created_at desc")
end
