$(document).ready(function() {
	submit_review();

})

function submit_review() {
	$('.new_review').on('submit', function(event) {
		event.preventDefault();

			$.post($(this).attr('action'), $(this).serialize(), function(response) {
				
				var template = $('#ajax-reviews').html();
					var rendered = Mustache.render(template, response);
						var targetId = response.restaurant.id;
							var currentRestaurant = $('.restaurant-parent-container[data-id=' + targetId + ']');
							currentRestaurant.find('ul').prepend(rendered);
							currentRestaurant.find('.average-rating').text('Average rating ' + response.restaurant.average_rating_stars);
							currentRestaurant.find('.review-count').text(response.restaurant.review_count);
			}, 'json');
	})
}

function create_restaurant() {
		$('.new_review').on('submit', function(event) {
		event.preventDefault();
}