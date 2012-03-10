class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @app = App.find(params[:app_id])
    @comment = @app.comments.build(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      
    else
      
    end
  end
end
