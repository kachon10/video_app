class AdsController < ApplicationController
  def index
    render :json => Ad.all
  end

  def create
    ad = Ad.create(:name => params[:ad][:name])
    render :json => ad
  end

  def show
    begin
      ad = Ad.find(params[:id])
      render :json => ad
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def destroy
    begin
      ad = Ad.find(params[:id])
      ad.destroy
      render :json => {}
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  private
end
