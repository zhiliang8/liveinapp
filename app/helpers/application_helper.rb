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
  
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:span, "<i class='icon-time'></i>#{t('common.created_at', :time => time_ago_in_words(time))}".html_safe, options.merge(:title => time.iso8601)) if time
  end
  
  def user_avatar_tag(user,size = :normal, opts = {})
    link = opts.delete(:link) || true
    width = 48
    case size
    when :normal
      width = 48
    when :small
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
      html = %(<a href="#{user_path(user.name)}" class="user_avatar" #{link_opts}>#{img}</a>)
    else
      html = img
    end
    raw html
  end
end
