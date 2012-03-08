# coding: utf-8
module AppsHelper
  def app_using(app)
    if current_user.present?
      if current_user.using(app) #正在使用
        link_to "正在使用", "#", :class => "btn btn-info app-using"
      elsif current_user.used(app) #使用过
        link_to "使用过", "#", :class => "btn btn-info disabled app-using"
      else #还没使用
        link_to "我在使用", "#", :class => "btn btn-info app-using"    
      end
    end
  end
end
