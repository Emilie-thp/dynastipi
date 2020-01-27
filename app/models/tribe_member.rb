class TribeMember < ApplicationRecord

	validates :name, presence: { message: "Veuillez indiquer un nom." }, length: { maximum: 20, too_long: "Le nom doit faire 20 caractères maximum" }
	validates :surname, presence: { message: "Veuillez indiquer un prénom." }, length: { maximum: 20, too_long: "Le prénom doit faire 20 caractères maximum" }
	validates :birthdate, presence: { message: "Veuillez indiquer une date de naissance." }
	validates :ancestor, presence: { message: "Veuillez choisir un numéro d'ancêtre." }, numericality: { only_integer: true, greater_than: 0 }
	validates :latitude, presence: { message: "Veuillez indiquer une latitude (ex : 27.10534 ou -43.106345)." }, format: { with: /\A-?[0-9]\d*(?:\.\d+)?(?:[kmbt])?\z/, message: "Veuillez entrer une latitude valide (ex : 27.10534 ou -43.106345)." }
	validates :longitude, presence: { message: "Veuillez indiquer une longitude (ex : 27.10534 ou -43.106345)." }, format: { with: /\A-?[0-9]\d*(?:\.\d+)?(?:[kmbt])?\z/, message: "Veuillez entrer une longitude valide (ex : 27.10534 ou -43.106345)." }

end
