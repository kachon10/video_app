class LikesController < ApplicationController

  def index
    begin
      video = Video.find(params[:video_id])
      render :json => video.likes.to_a
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def create
    begin
      user = User.find(params[:user])
      video = Video.find(params[:video_id])
      like = video.likes.find_by(:liked_by => user)
      if like.nil?
        like = video.likes.create(:liked_by => user)
      else
        raise "duplicate like"
      end      
      render :json => like
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def show
    begin
      video = Video.find(params[:video_id])
      like = video.likes.find(params[:id])
      render :json => like
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def destroy
    begin
      video = Video.find(params[:video_id])
      like = video.likes.find(params[:id])
      like.destroy
      render :json => {}
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end
end
