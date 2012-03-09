# coding: utf-8
module AppsHelper
  def app_using(app)
    if current_user.present? && current_user.using(app)
      content_tag(:span, "", )
    else #还没使用
      link_to "我在使用", "#", :class => "btn btn-info app-using"    
    end
  end
end
