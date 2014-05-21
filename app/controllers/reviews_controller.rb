class ReviewsController < ApplicationController

  def new
  	@restaurant = Restaurant.find( params[:restaurant_id] )
  	@review = Review.new
  end

  def create
  	  @restaurant = Restaurant.find( params[:restaurant_id] )
  	  review = @restaurant.reviews.create(params[:review].permit(:title, :thoughts, :rating))

  	  respond_to do |format|
  	  	format.html{ redirect_to '/restaurants' }
  	  	format.json{ render json: review }
  	  end

  end
end
