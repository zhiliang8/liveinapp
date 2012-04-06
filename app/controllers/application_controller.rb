class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :owner?, :can_change?
  
  before_filter :set_current_user
  
  def owner?(item)
    return false if item.blank?
    return if current_user.blank?
    item.user_id == current_user.id || item.rater_id == current_user.id
  end
  
  def can_change?(item) 
    return false if item.blank?
    return if current_user.blank?
    current_user.admin? || owner?(item)
  end
  
  def render_404
    render_optional_error_file(404)
  end
  
  def render_403
    render_optional_error_file(403)
  end

  def render_optional_error_file(status_code)
    status = status_code.to_s
    if ["404","403", "422", "500"].include?(status)
      render :template => "/errors/#{status}.html.erb", :status => status, :layout => "application"
    else
      render :template => "/errors/unknown.html.erb", :status => status, :layout => "application"
    end
  end
  
  private
    def set_current_user
      User.current = current_user
    end
end
