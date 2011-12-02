class UsersController < ApplicationController
  before_filter :find_user, :only => [:show]
  def show
    
  end
  protected
  def find_user
    @user = User.where(:name => params[:id]).first
  end
end
