class ClicksController < ApplicationController
  def index
    begin
      ad = Ad.find(params[:ad_id])
      render :json => ad.clicks.to_a
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def create
    begin
      video = Video.find(params[:video])
      ad = Ad.find(params[:ad_id])
      click = ad.clicks.create(:prerolled_by=>video)
      render :json => click
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def show
    begin
      ad = Ad.find(params[:ad_id])
      click = ad.clicks.find(params[:id])
      render :json => click
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def destroy
    begin
      ad = Ad.find(params[:ad_id])
      click = ad.clicks.find(params[:id])
      click.destroy
      render :json => {}
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end
end
