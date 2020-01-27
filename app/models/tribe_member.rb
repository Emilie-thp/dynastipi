class TribeMember < ApplicationRecord

	validates :name, presence: { message: "Veuillez indiquer un nom." }, length: { maximum: 20, too_long: "20 caractères maximum" }
	validates :surname, presence: { message: "Veuillez indiquer un prénom." }, length: { maximum: 20, too_long: "20 caractères maximum" }
	validates :birthdate, presence: true
	validates :ancestor, presence: true
	validates :latitude, presence: true, format: { with: /\A-?[0-9]\d*(?:\.\d+)?(?:[kmbt])?\z/, message: "Entrer une latitude valide." }
	validates :longitude, presence: true, format: { with: /\A-?[0-9]\d*(?:\.\d+)?(?:[kmbt])?\z/, message: "Entrer une longitude valide." }

end
