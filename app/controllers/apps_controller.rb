# encoding: utf-8
class AppsController < ApplicationController
  layout 'two_column', :only => [:index, :new, :edit]
  before_filter :authenticate_user!, :except => [:index]

  def index
    @node = Node.find(params[:node_id])
    @apps = @node.all_apps.page params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apps }
    end
  end

  def show
    @app = App.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app }
    end
  end

  def new
    @app = current_user.apps.build
    if params[:node].nil?
      @nodes = Node.all
    else
      @node = Node.find(params[:node])
      @app.node = @node
    end
    respond_to do |format|
      format.html
      format.json { render json: @app }
    end
  end

  def edit
    @app = App.find(params[:id])
    render_403 unless can_change?(@app)
  end

  def create
    @app = current_user.apps.build(params[:app])
    @app.user_name = current_user.name
    @app.node_name = @app.node.name
    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render json: @app, status: :created, location: @app }
      else
        format.html { render action: "new" }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @app = current_user.apps.find(params[:id])
    @app.user_name = current_user.name
    @app.node_name = @app.node.name
    respond_to do |format|
      if @app.update_attributes(params[:app])
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @app = App.find(params[:id])
    
    render_403 unless can_change?(@app)
    
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url }
      format.json { head :ok }
    end
  end
end
