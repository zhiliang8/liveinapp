module HomeHelper
  
  def node_link(node)
    if node.apps_count.present? && node.apps_count > 0
      link_to "#{node.name}(#{node.apps_count})", node_apps_path(node)
    else
      link_to node.name, node_apps_path(node)
    end
  end
  
end
