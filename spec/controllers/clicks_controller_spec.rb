require 'spec_helper'

describe ClicksController do

  it "returns error with invalid id" do
    get :index, :ad_id => 999
    expect(response.status).to_not eq(200)
  end

  it "return all clicks" do
    ad = FactoryGirl.create(:ad)
    ad.clicks.create()
    ad.clicks.create()

    get :index, :ad_id => ad.id
    expect(response.status).to eq(200)
    clicks = JSON.parse(response.body)
    expect(clicks.count).to eq(2)
  end

  it "should be able to add/destroy clicks" do
    video = FactoryGirl.create(:video)
    ad = FactoryGirl.create(:ad)

    post :create, :ad_id => ad.id, :video => video.id
    expect(response.status).to eq(200)

    get :index, :ad_id => ad.id
    expect(response.status).to eq(200)
    clicks = JSON.parse(response.body)
    expect(clicks.count).to eq(1)

    delete :destroy, :ad_id => ad.id, :id => clicks[0]["id"]
    expect(response.status).to eq(200)

    get :index, :ad_id => ad.id
    expect(response.status).to eq(200)
    clicks = JSON.parse(response.body)
    expect(clicks.count).to eq(0)

  end

end