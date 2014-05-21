$(document).ready(function() {
	$('.new_review').on('submit', function(event) {
		event.preventDefault();

			$.post($(this).attr('action'), $(this).serialize(), function(response) {
				console.log(response);

			}, 'json');
	
	})

})