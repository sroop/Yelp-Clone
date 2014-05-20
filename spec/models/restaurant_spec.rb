require 'spec_helper'

describe Restaurant do

	context 'It shows an error' do

			it 'when the name is blank' do
				restaurant = Restaurant.new(name: nil)
				expect(restaurant).to have(1).error_on(:name)
			end

	end
end
