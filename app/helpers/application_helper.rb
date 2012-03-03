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
  
  def init_nodes_data
    @roots = Node.roots
    @childless = Node.childless
  end
end
