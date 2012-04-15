# coding: utf-8
module ApplicationHelper
   def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :success if type == :notice
      type = :error if type == :alert
      text = content_tag(:div, link_to("x", "#", :class => "close", 'data-dismiss' => "alert") + message, :class => "alert alert-#{type}", "data-alert" => "alert")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end
  
  # def init_nodes_data
    # @roots = Node.roots
    # @childless = Node.childless
  # end
  
  def timeago(time, icon="<i class='icon-time'></i>", options = {})
    options[:class] ||= "timeago"
    content_tag(:span, "#{icon}#{time_ago_in_words(time)}".html_safe, options.merge(:title => time.iso8601)) if time
  end
  
  def user_avatar_tag(user,size = :normal, opts = {})
    link = opts.delete(:link) || true
    width = 48
    case size
    when :normal
      width = 48
    when :small
      width = 32
    when :mini
      width = 16
    when :large
      width = 64
    else
    width = size
    end

    hash = (user.blank? or user.email.blank?) ? Digest::MD5.hexdigest("") : Digest::MD5.hexdigest(user.email)
    return image_tag("http://www.gravatar.com/avatar/#{hash}.png?s=#{width}&d=identicon")  if user.blank?

    img_src = "http://www.gravatar.com/avatar/#{hash}.png?s=#{width}&d=identicon"
    img = image_tag(img_src, :style => "width:#{width}px;height:#{width}px;")
    html = ""
    if link
      link_opts = opts.map{|k, v| %(#{k}="#{v}")}.join(" ")
      html = %(<a href="#{user_path(user.name)}" class="user-avatar" title="#{user.name}" #{link_opts}>#{img}</a>)
    else
      html = img
    end
    raw html
  end
  
  def app_show?
     params[:controller] == 'apps' && params[:action] == 'show'
  end
  
  def link_to_or_login(title, href, options={})
    if current_user.present?
      link_to title, href, options
    else
      link_to title, new_user_session_path, options.merge({:rel => "tooltip", :title => "请先登录"})
    end
  end
  
  def apps_menu(params)
    apps_menus = {:recent => "最新添加", :recent_update => "最新更新", :hot_use => "最多用户", :hot_rate => "评价最高"}
    url = params['controller'] == "home" ? apps_path : url_for(:only_path => false)
    order = params[:order].present? ? params[:order].to_sym : :recent
    len = apps_menus.length
    
    "所有云应用".tap do |html|
      html << "<div class=\"pull-right\" id=\"apps_menu\">排序："
      apps_menus.each_with_index do |elem, index|
        html << link_to_unless(elem[0]==order, elem[1], url + "?" +params.reject{|k,v|['controller', 'action','node_id'].include?(k)}.merge({:order=>elem[0]}).to_query)
        html << " / " if index != len-1
      end
      html << "</div>"
    end.html_safe
  end
end
