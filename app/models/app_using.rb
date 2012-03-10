class AppUsing < ActiveRecord::Base
  belongs_to :app, :counter_cache => :using_user_count
  belongs_to :user, :counter_cache => :using_app_count
end
