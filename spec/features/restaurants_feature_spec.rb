require 'spec_helper'

describe 'Restaurants index page' do
	context 'Day 1: No Restaurants to show on the page' do
		it 'should display a message if no restaurants' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants yet')
		end
	end
end

describe 'Creating a restaurant' do

	context 'When a user is logged out' do
		
		it 'create restaurant button takes you to the sign up / sign in page' do
			visit '/restaurants/'
			click_on 'Create a restaurant'
			# expect(current_path).to eq('/restaurants/sign-in or sign-up')
			expect(page).to_not have_content "✖"
			expect(page).to_not have_content "✐"
		end

	end

	context 'When a user is logged in' do
		
		it 'adds a restaurant to the restaurant index (happy path)' do
			login_as user
			visit '/restaurants/'
			fill_in "Name", with: 'McDonalds'
			fill_in "Cuisine", with: 'Fast food'
			click_button 'Add'
			expect(current_path).to eq('/restaurants')
			expect(page).to have_content('McDonalds')
		end

		it 'does not add a restaurant to the restaurant index (sad path)' do
			login_as user
			visit '/restaurants/'
			fill_in 'Name', with: 'McDonalds'
			click_button 'Add'
			expect(page).to_not have_content('McDonalds')
			expect(page).to have_content("1 error prohibited this post from being saved")
		end

	end
end

describe 'Editing a restaurant' do
	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'Fast food')
	end

	context 'When a user is logged out' do
		
		it 'does not have the ability to edit a restaurant' do
			visit '/restaurants/'
			# expect(current_path).to eq('/restaurants/sign-in or sign-up')
			expect(page).to_not have_content "✖"
		end

	end

	context 'When a user is logged in' do

		context 'inputs valid data' do
			
			it 'saves the updated restaurant' do
				login_as user
				visit '/restaurants'
				expect(page).to have_content('McDonalds')
				click_on '✐'
				fill_in 'Name', with: 'Burger King'
				click_button 'Add'
				expect(page).to have_content('Burger King')
			end
		end

		context 'inputs invalid data' do
			
			it 'displays an error' do
				login_as user
				visit '/restaurants'
				expect(page).to have_content('McDonalds')
				click_on '✐'
				fill_in 'Name', with: nil
				click_button 'Add'
				expect(page).to have_content('error')
			end
		end

	end	

end

describe 'Delete a restaurant' do
	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'Fast food')
	end

	context 'When a user is logged out' do
		
		it 'does not have the ability to delete a restaurant' do
			visit '/restaurants/'
			# expect(current_path).to eq('/restaurants/sign-in or sign-up')
			expect(page).to_not have_content "✖"
		end

	end

	context 'When a user is logged in' do

		it 'deletes an existing restaurant in the restaurant index' do
			login_as user
			visit '/restaurants'
			expect(page).to have_content('McDonalds')
			click_on '✖'
			expect(page).to_not have_content('McDonalds')
			expect(page).to have_content("Successfully deleted!")
		end

	end
end

