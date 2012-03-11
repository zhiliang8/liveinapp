# coding: utf-8
class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @app = App.find(params[:app_id])
    @comment = @app.comments.build(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      flash.now[:notice] = "评论成功"
    else
      flash.now[:alert] = "评论失败"
    end
  end
end
