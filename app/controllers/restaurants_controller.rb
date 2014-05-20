class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		restaurant = Restaurant.new( params[:restaurant].permit(:name, :cuisine) )
		if restaurant.save
			redirect_to('/restaurants')
		else
			redirect_to('/restaurants/new')
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update( params[:restaurant].permit(:name, :cuisine) )
		redirect_to('/restaurants')
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice] = "Successfully deleted!"
		redirect_to('/restaurants')
	end

end
