# coding: utf-8
class NewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :destroy]
  def index
  end

  def create
    @app = App.find(params[:app_id])
    @news = @app.news.build(params[:news])
    @news.user = current_user
    if @news.save
      flash.now[:notice] = "新闻添加成功"
    else
      flash.now[:notice] = "新闻添加失败"
    end
      
  end

  def destroy
  end
end
