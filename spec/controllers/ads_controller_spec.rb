require 'spec_helper'

describe AdsController do

  it "return all ads" do
    FactoryGirl.create(:ad, :name=>"ad1")
    FactoryGirl.create(:ad, :name=>"ad2")
    
    get :index
    expect(response.status).to eq(200)
    ads = JSON.parse(response.body)
    expect(ads.count).to eq(2)
  end

  it "should be able to add/destroy ad" do
    
    post :create, {:ad => {:name => "300"} }
    expect(response.status).to eq(200)
    ad = JSON.parse(response.body)
    expect(ad["name"]).to eq("300")

    get :index
    expect(response.status).to eq(200)
    ads = JSON.parse(response.body)
    expect(ads.count).to eq(1)

    delete :destroy, id: ad["id"]
    expect(response.status).to eq(200)

    get :index
    expect(response.status).to eq(200)
    ads = JSON.parse(response.body)
    expect(ads.count).to eq(0)
  end

  it "should return correct click count" do
    video = FactoryGirl.create(:video)
    ad = FactoryGirl.create(:ad)
    c1 = ad.clicks.create()
    c1.prerolled_by = video
    c1.save
    c2 = ad.clicks.create()
    c2.prerolled_by = video
    c2.save

    get :show, :id => ad.id
    expect(response.status).to eq(200)
    ad = JSON.parse(response.body)
    expect(ad["click_count"]).to eq(2)
  end
end