class FeedsController < ApplicationController
  def index
    @user = User.where(:name => params[:id]).first
    @feeds = @user.feeds
  end
end
