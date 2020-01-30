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

  describe "search method" do
	  
		context "with a precise params" do
			it "finds a searched tribe_member by name" do
		    tribe_member = TribeMember.create(name: "TestName", surname: "Bonjour", birthdate: "1794-02-12", ancestor: 2300, latitude: "2.34555", longitude: "45.2345")
		    @result = TribeMember.search("TestName")
		    expect(@result).to eq([tribe_member])
		  end

		  it "finds a searched tribe_member by date" do
		    tribe_member = TribeMember.create(name: "TestYear", surname: "Bonjour", birthdate: "2002-02-12", ancestor: 2300, latitude: "2.34555", longitude: "45.2345")
		    @result = TribeMember.search("2002")
		    expect(@result).to eq([tribe_member])
		  end
		end

	end

end
