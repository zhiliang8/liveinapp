class UsersController < ApplicationController
  layout 'user'
  set_tab :home, :users, :only => %(show)
  before_filter :find_user, :only => [:show]
  def show
    @using_apps = @user.using_apps.limit(5)
    @apps = @user.apps.limit(5)
    @feeds = @user.feeds.page params[:page]
  end
  protected
  def find_user
    @user = User.where(:name => params[:id]).first
  end
end
