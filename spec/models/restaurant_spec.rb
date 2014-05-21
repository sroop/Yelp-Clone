require 'spec_helper'

describe Restaurant do

	context 'It shows an error' do

			let(:restaurant1) { Restaurant.new(name: nil, cuisine: "American") }
			let(:restaurant2) { Restaurant.new(name: "The Diner", cuisine: nil) }

			it 'when the name is blank' do
				expect(restaurant1).to have(1).error_on(:name)
			end

			it 'when the cuisine is blank' do
				expect(restaurant2).to have(1).error_on(:cuisine)
			end

	end

end

describe '#average_rating' do


	let(:restaurant) { Restaurant.create(name: "The Diner", cuisine: "American") }

	context 'calculates the average rating for zero reviews' do

		it 'says N/A for zero reviews' do
			expect(restaurant.average_rating).to eq('N/A')
		end

	end

	context 'says the rating for one review' do

		before(:each) do
			restaurant.reviews.create(rating: 3)
		end

		it 'says 3 for one review' do
			expect(restaurant.average_rating).to eq(3)
		end
			
	end

	context 'calculates the average for more than 1 review' do

		before(:each) do
			restaurant.reviews.create(rating: 4)
			restaurant.reviews.create(rating: 5)
		end

		it 'says 4.5 as the average for 2 reviews' do
			expect(restaurant.average_rating).to eq(4.5)
		end

	end

end
