class VideosController < ApplicationController
  
  def index
    render :json => Video.all
  end

  def create
    user = User.find(params[:video][:user])
    video = Video.create(
              :name => params[:video][:name], 
              :user => user)
    render :json => video
  end

  def show
    begin
      video = Video.find(params[:id])
      render :json => video
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def destroy
    begin
      video = Video.find(params[:id])
      video.destroy
      render :json => {}
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  private

end
