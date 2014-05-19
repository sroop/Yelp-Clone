class RestaurantsController < ApplicationController

	def index
	end

	def new
	end

	def create
		Restaurant.create({name: 'McDonalds', cuisine: 'Fast Food'})
		redirect_to('/restaurants')
	end

end
