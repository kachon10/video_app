require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user, :name=>"tom") }

  it "return all user" do
    FactoryGirl.create(:user, :name=>"tom1")
    FactoryGirl.create(:user, :name=>"tom2")
    
    get :index
    expect(response.status).to eq(200)
    users = JSON.parse(response.body)
    expect(users.count).to eq(2)
  end

  it "should be able to add/destroy user" do
    
    post :create, {:user => {:name => "tom3"} }
    expect(response.status).to eq(200)
    user = JSON.parse(response.body)
    puts "user #{user}"
    expect(user["name"]).to eq("tom3")

    get :index
    expect(response.status).to eq(200)
    users = JSON.parse(response.body)
    expect(users.count).to eq(1)

    delete :destroy, id: user["id"]
    expect(response.status).to eq(200)

    get :index
    expect(response.status).to eq(200)
    users = JSON.parse(response.body)
    expect(users.count).to eq(0)

  end
end