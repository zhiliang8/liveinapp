class HomeController < ApplicationController
  layout 'three_column', :only => :index
  def index
    @apps = App.latest.page params[:page]
    @app_count = App.count
    @user_count = User.count
    @comments = Comment.limit(10)
  end

end
