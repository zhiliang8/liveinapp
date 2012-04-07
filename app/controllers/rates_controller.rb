# encoding: utf-8
class RatesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @app = App.find(params[:app_id])
    rate_id = params[:rate][:id]
    
    if rate_id.present?
      @rate = @app.rates.where(:rater => current_user).first
      render_403 unless can_change?(@rate)
      @rate.stars = to_stars(params)
      respond_to do |format|
        if @rate.save
          format.html { redirect_to @app, notice: '评价成功。' }
          format.json { render json: @app, status: :created, location: @app }
        else
          format.html { redirect_to @app, notice: '评价失败。' }
          format.json { render json: @app.errors, status: :unprocessable_entity }
        end
      end
    else
      @rate = @app.rates.build(params[:rate])
      @rate.rater = current_user
      @rate.stars = to_stars(params)
      respond_to do |format|
        if @rate.save
          format.html { redirect_to @app, notice: '评价成功。' }
          format.json { render json: @app, status: :created, location: @app }
        else
          format.html { redirect_to @app, notice: '评价失败。' }
          format.json { render json: @app.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  private
  def to_stars(params)
    stars = {}
    App::RATE_DIMENSIONS.keys.each do |k|
      stars["#{k}"] = params["star_#{k}"] || "0"
    end
    stars.to_json
  end
end
