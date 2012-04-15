class HomeController < ApplicationController
  set_tab :home
  layout 'three_column', :only => :index
  def index
    @apps = App.recent.page params[:page]
  end

end
