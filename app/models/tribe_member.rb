class TribeMember < ApplicationRecord

	validates :name, presence: { message: "Veuillez indiquer un nom." }, length: { maximum: 20, too_long: "Le nom doit faire 20 caractères maximum" }
	validates :surname, presence: { message: "Veuillez indiquer un prénom." }, length: { maximum: 20, too_long: "Le prénom doit faire 20 caractères maximum" }
	validates :birthdate, presence: { message: "Veuillez indiquer une date de naissance." }
	validates :ancestor, presence: { message: "Veuillez choisir un numéro d'ancêtre." }, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: self.all.length }
	validates :latitude, presence: true
	validates :longitude, presence: true 

 def self.search(params)
    #result1 regroups members whose name or surname or birthdate is composed of the searched string
    result1 = self.where("name LIKE ? OR surname LIKE ? OR birthdate LIKE ?", "%"+params+"%", "%"+params+"%", "%"+params+"%")
    #result2 regroups members whose ancestor's name or surname is composed of the searched string
    result2 = self.where(ancestor: TribeMember.ancestor_ids(params))
    #final_result is combination of result1 and result2
    final_result = result1.or(result2) 
  end

  #to find ids of ancestors from their name or surname
  def self.ancestor_ids(params)
    return self.where("name LIKE ? OR surname LIKE ?", "%"+params+"%", "%"+params+"%").ids
  end

end
