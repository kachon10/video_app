require 'spec_helper'

describe VideosController do

  it "return all videos" do
    FactoryGirl.create(:video, :name=>"300")
    FactoryGirl.create(:video, :name=>"3002")
    
    get :index
    expect(response.status).to eq(200)
    videos = JSON.parse(response.body)
    expect(videos.count).to eq(2)
  end

  it "should be able to add/destroy video" do
    
    post :create, {:video => {:name => "300"} }
    expect(response.status).to eq(200)
    video = JSON.parse(response.body)
    expect(video["name"]).to eq("300")

    get :index
    expect(response.status).to eq(200)
    videos = JSON.parse(response.body)
    expect(videos.count).to eq(1)

    delete :destroy, id: video["id"]
    expect(response.status).to eq(200)

    get :index
    expect(response.status).to eq(200)
    videos = JSON.parse(response.body)
    expect(videos.count).to eq(0)
  end

  it "should return correct view count" do
    user = FactoryGirl.create(:user)
    video = FactoryGirl.create(:video)
    v1 = video.views.create()
    v1.viewed_by = user
    v1.save
    v2 = video.views.create()
    v2.viewed_by = user
    v2.save

    get :show, :id => video.id
    expect(response.status).to eq(200)
    video = JSON.parse(response.body)
    expect(video["view_count"]).to eq(2)
  end
end
