require 'spec_helper'

describe Review do

	context 'validating the rating' do

		it 'can rate a restaurant no higher than 5' do
			review = Review.new(title: "old street", thoughts: "average", rating: 10)
			expect(review).to have(1).error_on(:rating)
		end

		it 'can rate a restaurant no lower than 1' do
			review = Review.new(title: "old street", thoughts: "average", rating: 0)
			expect(review).to have(1).error_on(:rating)
		end

	end

end
