require 'spec_helper'

describe ViewsController do

  it "returns error with invalid id" do
    get :index, :video_id => 999
    expect(response.status).to_not eq(200)
  end

  it "return all views" do
    video = FactoryGirl.create(:video)
    video.views.create()
    video.views.create()

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    views = JSON.parse(response.body)
    expect(views.count).to eq(2)
  end

  it "should be able to add/destroy views" do
    user = FactoryGirl.create(:user)
    video = FactoryGirl.create(:video)

    post :create, :video_id => video.id, :user => user.id
    expect(response.status).to eq(200)

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    views = JSON.parse(response.body)
    expect(views.count).to eq(1)

    delete :destroy, :video_id => video.id, :id => views[0]["id"]
    expect(response.status).to eq(200)

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    views = JSON.parse(response.body)
    expect(views.count).to eq(0)

  end

end