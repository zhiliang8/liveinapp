class FeedObserver < ActiveRecord::Observer
  observe :user, :app, :app_using, :comment
  
  def after_create(model)
    values = feed_values(model)
    values[:action] = "ADD"
    Feed.create(values)
  end
    
  def after_update(model)
    values = feed_values(model)
    values[:action] = "EDIT"
    Feed.create(values)
  end
  
  private
    def feed_values(model) 
      values = {:target_id => model.id, :target_type => model.class.name, :raw_data => raw_data(model)}
      values[:user_id] = User.current.id if User.current
      values
    end
    def raw_data(model)
      data = {}
      actor = model.respond_to?(:user) ? model.user : model
      data[:user_name] = actor.name
      data[:user_avater] = actor.avatar if actor.respond_to?(:avatar)
      data[:user_email] = actor.email
      title = model.respond_to?(:name) ? model.name : (model.respond_to?(:title) ? model.title : nil)
      if title.present?
        data[:target_title] = title
      end
      data[:body] = model.body if model.respond_to?(:body)
      data.to_s
    end
end
