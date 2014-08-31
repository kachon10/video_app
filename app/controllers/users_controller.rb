class UsersController < ApplicationController
  
  def index
    render :json => User.all
  end

  def create
    user = User.create(:name => params[:user][:name])
    render :json => user
  end

  def show
    begin
      user = User.find(params[:id])
      render :json => user
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      user.destroy
      render :json => {}
    rescue Exception => ex
      render :json => {
        :msg => ex.message
        }, :status => 400
    end
  end
end
