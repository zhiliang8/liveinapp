class HomeController < ApplicationController
  layout 'three_column', :only => :index
  def index
    @apps = App.approved.page params[:page]
    
  end

end
