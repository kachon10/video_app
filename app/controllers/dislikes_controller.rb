class DislikesController < ApplicationController

  def index
    begin
      video = Video.find(params[:video_id])
      render :json => video.dislikes.to_a
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
      dislike = video.dislikes.create
      dislike.disliked_by = user
      render :json => dislike
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def show
    begin
      video = Video.find(params[:video_id])
      dislike = video.dislikes.find(params[:id])
      render :json => dislike
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def destroy
    begin
      video = Video.find(params[:video_id])
      dislike = video.dislikes.find(params[:id])
      dislike.destroy
      render :json => {}
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end
end
