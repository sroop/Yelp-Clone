class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurants = Restaurant.new
	end

	def create
		Restaurant.create({name: 'McDonalds', cuisine: 'Fast Food'})
		redirect_to('/restaurants')
	end

end
