class HomeController < ApplicationController
  set_tab :home
  layout 'three_column', :only => :index
  def index
    @apps = App.latest.page params[:page]
  end

end
