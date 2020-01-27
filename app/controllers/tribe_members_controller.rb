class TribeMembersController < ApplicationController
  
  def index
		if params[:search] 
      #result1 regroups members whose name or surname or birthdate is composed of the searched string
			result1 = TribeMember.where("name LIKE ? OR surname LIKE ? OR birthdate LIKE ?", "%"+params[:search]+"%", "%"+params[:search]+"%", "%"+params[:search]+"%")
      #result2 regroups members whose ancestor's name or surname is composed of the searched string
      result2 = TribeMember.where(ancestor: ancestor_ids(params[:search]))
      #final_result is combination of result1 and result2
      final_result = result1.or(result2) 
      @tribe_members = final_result.page(params[:page])
  	else
      #use of .page(params[:page]) for the pagination gem 'kaminari'
	  	@tribe_members = TribeMember.page(params[:page])
	  end
  end

  def new
    @tribe_member = TribeMember.new
  end

  def create
    @tribe_member = TribeMember.new(member_params)
    if @tribe_member.save
      flash[:notice] = "Le #{@tribe_member.id}ème membre a été ajouté à la tribu"
      redirect_to root_path
    else
      render "new"
    end
  end



  private 


  def member_params
  	params.require(:tribe_member).permit(:name, :surname, :birthdate, :ancestor, :longitude, :latitude)
	end

  #to find ids of ancestors from their name or surname
  def ancestor_ids(params)
    return TribeMember.where("name LIKE ? OR surname LIKE ?", "%"+params+"%", "%"+params+"%").ids
  end

end
