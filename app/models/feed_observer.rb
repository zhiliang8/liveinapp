class FeedObserver < ActiveRecord::Observer
  observe :user, :app, :app_using
  
  def after_create(model)
    Feed.create(:target_id => model.id, :target_type => model.class.name, :action => "ADD")
  end
    
  def after_update(model)
    Feed.create(:target_id => model.id, :target_type => model.class.name, :action => "EDIT")
  end
end
