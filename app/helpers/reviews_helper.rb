module ReviewsHelper

	def star_rating(value)
		return value unless value.respond_to?(:round)
		rounded = value.round
			full_stars = "★" * rounded
			empty_stars = "☆" * (5 - rounded)
			full_stars + empty_stars
	end

end
