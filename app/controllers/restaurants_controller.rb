class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurants = Restaurant.new
	end

	def create
		Restaurant.create( params[:restaurant].permit(:name, :address) )
		redirect_to('/restaurants')
	end

	# def edit
	# 	@restaurant = Restaurant.find(params[:id])
	# end

end
