class GlobalCell < Cell::Rails
  cache :stats, :expires_in => 1.hours
  def stats
    @app_count = App.count
    @user_count = User.count
    render
  end
end
