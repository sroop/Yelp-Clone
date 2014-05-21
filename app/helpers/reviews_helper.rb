module ReviewsHelper

	def star_rating(number)
		full_stars = "★" * number
		empty_stars = "☆" * (5 - number)
		full_stars + empty_stars
	end

end
