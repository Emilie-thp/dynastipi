require 'rails_helper'

RSpec.describe TribeMember, type: :model do

describe "POST create" do
  context "with valid attributes" do
    it "creates a new tribe_member" do
      expect { 
        post :create, params: { "tribe_member" => { name: "Test", surname: "Create", birthdate: "1994-02-12", ancestor: 2345, latitude: "25.3938", longitude: "6.2394" } }
      }.to change(TribeMember,:count).by(1)
    end
  end
  
  context "with invalid attributes" do
    it "doest not create a new tribe_member" do
      expect { 
        post :create, params: { "tribe_member" => { name: "Test", surname: "Create", birthdate: "1994-02-12", ancestor: "Test", latitude: "Test", longitude: "6.2394" } }
      }.to_not change(TribeMember, :count)
    end
    
    it "re-renders the new method" do
      post :create, params: { "tribe_member" => { name: "Test", birthdate: "1994-02-12", ancestor: 2345, latitude: "25.3938", longitude: "6.2394" } }
      response.should render_template :new
    end
  end

end


end