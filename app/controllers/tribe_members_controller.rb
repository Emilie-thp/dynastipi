class TribeMembersController < ApplicationController
  
  def index
  	@tribe_members = TribeMember.all
  end

  def new
  end
end
