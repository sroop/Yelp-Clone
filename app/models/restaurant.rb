class Restaurant < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :cuisine, presence: true

	has_many :reviews

	def average_rating
		if reviews.any?
			reviews.average(:rating).round(1)
		else
			"N/A"
		end
	end

end
