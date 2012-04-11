class AppCell < Cell::Rails
  cache :sidebar_app_nodes, :expires_in => 1.hours
  def sidebar_app_nodes
    @nodes = Node.all
    render
  end

end
