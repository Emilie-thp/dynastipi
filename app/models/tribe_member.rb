class TribeMember < ApplicationRecord

	validates :name, presence: { message: "Veuillez indiquer un nom." }, length: { maximum: 20, too_long: "Le nom doit faire 20 caractères maximum" }
	validates :surname, presence: { message: "Veuillez indiquer un prénom." }, length: { maximum: 20, too_long: "Le prénom doit faire 20 caractères maximum" }
	validates :birthdate, presence: { message: "Veuillez indiquer une date de naissance." }
	validates :ancestor, presence: { message: "Veuillez choisir un numéro d'ancêtre." }, numericality: { only_integer: true, greater_than: 0 }
	validates :latitude, presence: true
	validates :longitude, presence: true 
end
