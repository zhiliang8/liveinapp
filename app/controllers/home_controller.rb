class HomeController < ApplicationController
  layout 'three_column', :only => :index
  def index
    @apps = App.approved.page params[:page]
    @app_count = App.approved.count
    @user_count = User.count
  end

end
