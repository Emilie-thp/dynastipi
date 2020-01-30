require 'rails_helper'

RSpec.describe TribeMembersController, type: :controller do

	describe "POST create" do

	  context "with valid attributes" do
	    it "creates a new tribe_member" do
	      expect { 
	        post :create, params: { "tribe_member" => { name: "Laoum", surname: "Foutim", birthdate: "1794-02-12", ancestor: 2345, location: "2.34555,45.2345" } }
	      }.to change(TribeMember,:count).by(1)
	    end
	  end
	  
	  context "with invalid attributes" do
	    it "doest not create a new tribe_member" do
	      expect { 
	        post :create, params: { "tribe_member" => { name: "Laoum", surname: "Foutim", birthdate: "1794-02-12", ancestor: "Not a number", location: "2.34555,45.2345" } }
	      }.to_not change(TribeMember, :count)
	    end
	  end

	end

end
