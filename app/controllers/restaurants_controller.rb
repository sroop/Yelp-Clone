class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
		@review = Review.new
		@restaurant = Restaurant.new
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new( params[:restaurant].permit(:name, :cuisine) )
		if @restaurant.save
			render 'create.json', content_type: :json
		else
			# restaurant.errors.full_messages
			render('new')
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update( params[:restaurant].permit(:name, :cuisine) )
			redirect_to('/restaurants')
		else
			render('edit')
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice] = "Successfully deleted!"
		redirect_to('/restaurants')
	end

end
