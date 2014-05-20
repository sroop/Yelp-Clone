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
