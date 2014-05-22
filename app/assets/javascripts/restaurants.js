$(document).ready(function() {
	submitReview();
	createRestaurant();

})

function submitReview() {
	disableButton('.new_review', function(form){
		$.post($(form).attr('action'), $(form).serialize(), function(response) {
			
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

function createRestaurant() {
	disableButton('.new_restaurant', function(){
		
	});
}

function disableButton(className, callback) {
	$(className).on('submit', function(event) {
		event.preventDefault();
		callback(this);
	})
}