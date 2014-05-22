
json.review do

	json.title @review.title
	json.thoughts @review.thoughts
	json.star_rating star_rating(@review.rating)

end

json.restaurant do

	json.id @restaurant.id
	json.average_rating_stars star_rating(@restaurant.average_rating)
	json.review_count pluralize(@restaurant.reviews.count, 'review')

end

