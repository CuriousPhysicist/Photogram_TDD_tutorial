require 'rails_helper'

feature 'Creating a new User' do
	background do
		visit '/'
		click_link 'Register'
	end

	scenario 'can crete a new user via the index page' do
		fill_in 'User name', with: 'sxyrailsdev'
		fill_in 'Email', with: 'sxyrailsdev@myspace.com'
		fill_in 'Password', with: 'supersecret', match: :first
		fill_in 'Password confirmation', with: 'supersecret'

		click_button 'Sign up'
		expect(page).to have_content('Welcome! You have signed up successfully.')
	end

	scenario 'requires a user name to successfully create a user account' do
		fill_in 'Email', with: 'sxyrailsdev@myspace.com'
		fill_in 'Password', with: 'supersecret', match: :first
		fill_in 'Password confirmation', with: 'supersecret'

		click_button 'Sign up'
		expect(page).to have_content("can't be blank")
	end

	scenario 'requires a user name to be more that 4 characters' do
		fill_in 'User name', with: 'h'
		fill_in 'Email', with: 'sxyrailsdev@myspace.com'
		fill_in 'Password', with: 'supersecret', match: :first
		fill_in 'Password confirmation', with: 'supersecret'

		click_button 'Sign up'
		expect(page).to have_content("minimum is 4 characters")
	end

	scenario 'requires a user name to be less than 12 characters' do
		fill_in 'User name', with: 'reallyreallylong'
		fill_in 'Email', with: 'sxyrailsdev@myspace.com'
		fill_in 'Password', with: 'supersecret', match: :first
		fill_in 'Password confirmation', with: 'supersecret'

		click_button 'Sign up'
		expect(page).to have_content('maximum is 12 characters')
	end
end