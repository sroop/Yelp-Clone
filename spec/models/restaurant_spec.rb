require 'spec_helper'

describe Restaurant do

	context 'It shows an error' do

			let(:restaurant) { Restaurant.new(name: nil) }

			it 'when the name is blank' do
				expect(restaurant).to have(1).error_on(:name)
			end

			it 'when the cuisine is blank' do
				expect(restaurant).to have(1).error_on(:cuisine)
			end

	end
end
