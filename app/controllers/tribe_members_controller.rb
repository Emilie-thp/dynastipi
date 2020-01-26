class TribeMembersController < ApplicationController
  
  def index
  	@tribe_members = TribeMember.page(params[:page])
  end

  def new
  end
end
