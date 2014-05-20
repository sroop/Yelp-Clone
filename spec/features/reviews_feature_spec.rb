require 'spec_helper'

describe 'writing review' do
	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'Fast food')
	end

	specify 'restaurants begin with no reviews' do
		visit '/restaurants'
		expect(page).to have_content('0 reviews')
	end

	it 'adds the review to the restaurant' do
		visit '/restaurants'
		click_on 'Review'
		fill_in 'Thoughts', with: 'Pretty good...'
		select '4', from: 'Rating'
		click_button 'Leave Review'
		expect(current_path).to eq('/restaurants')
		expect(page).to have_content('Pretty good...')
		expect(page).to have_content('1 review')
	end
end