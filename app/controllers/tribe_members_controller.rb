class TribeMembersController < ApplicationController
  
  def index
  	puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  	puts params 
		if params[:search]  	
			@tribe_members = TribeMember.where("name LIKE ? OR surname LIKE ? OR birthdate LIKE ?", "%"+params[:search]+"%", "%"+params[:search]+"%", "%"+params[:search]+"%").page(params[:page])
  	else
	  	@tribe_members = TribeMember.page(params[:page])
	  end
  end

  def new
  end

  def tribe_members_params
  	params.require(:tribe_member).permit(:name, :surname, :birthdate, :ancestor, :longitude, :latitude)
	end

end
