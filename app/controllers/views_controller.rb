class ViewsController < ApplicationController

  def index
    begin
      video = Video.find(params[:video_id])
      render :json => video.views.to_a
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
      view = video.views.create(:viewed_by=>user)
      render :json => view
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def show
    begin
      video = Video.find(params[:id])
      view = video.views.find(params[:video_id])
      render :json => view
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def destroy
    begin
      video = Video.find(params[:id])
      view = video.views.find(params[:video_id])
      view.destroy
      render :json => {}
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  private
end
