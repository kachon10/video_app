require 'spec_helper'

describe LikesController do

  it "returns error with invalid id" do
    get :index, :video_id => 999
    expect(response.status).to_not eq(200)
  end

  it "return all likes" do
    video = FactoryGirl.create(:video)
    video.likes.create()
    video.likes.create()

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    likes = JSON.parse(response.body)
    expect(likes.count).to eq(2)
  end

  it "should be able to add/destroy likes" do
    user = FactoryGirl.create(:user)
    video = FactoryGirl.create(:video)

    post :create, :video_id => video.id, :user => user.id
    expect(response.status).to eq(200)

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    likes = JSON.parse(response.body)
    expect(likes.count).to eq(1)

    delete :destroy, :video_id => video.id, :id => likes[0]["id"]
    expect(response.status).to eq(200)

    get :index, :video_id => video.id
    expect(response.status).to eq(200)
    likes = JSON.parse(response.body)
    expect(likes.count).to eq(0)

  end

end