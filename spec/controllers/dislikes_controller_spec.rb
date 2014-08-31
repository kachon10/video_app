require 'spec_helper'

describe DislikesController do

  it "returns error with invalid id" do
    get :index, :video_id => 999
    expect(response.status).to_not eq(200)
  end

  it "return all dislikes" do
    video = FactoryGirl.create(:video)
    video.dislikes.create()
    video.dislikes.create()

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    dislikes = JSON.parse(response.body)
    expect(dislikes.count).to eq(2)
  end

  it "should be able to add/destroy dislikes" do
    user = FactoryGirl.create(:user)
    video = FactoryGirl.create(:video)

    post :create, :video_id => video.id, :user => user.id
    expect(response.status).to eq(200)

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    dislikes = JSON.parse(response.body)
    expect(dislikes.count).to eq(1)

    delete :destroy, :video_id => video.id, :id => dislikes[0]["id"]
    expect(response.status).to eq(200)

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    dislikes = JSON.parse(response.body)
    expect(dislikes.count).to eq(0)

  end

end