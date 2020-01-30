class TribeMembersController < ApplicationController
  
  def index
		if params[:search] 
      #result1 regroups members whose name or surname or birthdate is composed of the searched string
			result1 = TribeMember.where("name LIKE ? OR surname LIKE ? OR birthdate LIKE ?", "%"+params[:search]+"%", "%"+params[:search]+"%", "%"+params[:search]+"%")
      #result2 regroups members whose ancestor's name or surname is composed of the searched string
      result2 = TribeMember.where(ancestor: ancestor_ids(params[:search]))
      #final_result is combination of result1 and result2
      @final_result = result1.or(result2) 
      @tribe_members = @final_result.page(params[:page])
  	else
      #use of .page(params[:page]) for the pagination gem 'kaminari'
	  	@tribe_members = TribeMember.page(params[:page])
	  end
  end

  def new
    @tribe_member = TribeMember.new
  end

  def create
    #array of latitude and longitude collected from the map thanks to JS
    loc_array = params[:tribe_member][:location].split(",")

    @tribe_member = TribeMember.new(member_params)
    @tribe_member.latitude = loc_array[0]
    @tribe_member.longitude = loc_array[1]
    if @tribe_member.save
      flash[:notice] = "Le #{@tribe_member.id}ème membre a été ajouté à la tribu"
      redirect_to root_path
    else
      render "new"
    end
  end

  def stat
    @total = TribeMember.all.length
    @age_array = age_array
    @average = average(@age_array)
    @oldest = @age_array.max

    #handmade hash for chartkick as it was not working with the group_by_year line
    @chart_hash = TribeMember.all.group_by { |u| u.birthdate.year }.map { |k, v| [k, v.count] }.to_h 
  end



  private 


  def member_params
  	params.require(:tribe_member).permit(:name, :surname, :birthdate, :ancestor)
	end

  #to find ids of ancestors from their name or surname
  def ancestor_ids(params)
    return TribeMember.where("name LIKE ? OR surname LIKE ?", "%"+params+"%", "%"+params+"%").ids
  end

  #to calculte age from date of birth
  def age(birthdate)
    now = Time.now
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  #to regroup each member age in an array
  def age_array
    return TribeMember.all.map {|member| age(member.birthdate)}
  end

  #to calculte an average of an array of number
  def average(array)
    array.inject(&:+) / array.length
  end

end
