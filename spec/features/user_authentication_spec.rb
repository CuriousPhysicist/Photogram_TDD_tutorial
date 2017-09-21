require 'rails_helper'

feature 'User authentication' do	

	scenario 'can log in from index via dynamic navbar' do
		
		user = create :user

		sign_in_with user

		expect(page).to have_content('Signed in successfully.')
		expect(page).to_not have_content('Register')
		expect(page).to have_content('Logout')
	end

	scenario 'can log out once logged in' do
		
		user = create :user

		sign_in_with user

		click_link 'Logout'
		expect(page).to have_content('You need to sign in or sign up before continuing')
	end

	scenario 'cannot view index posts without logged in' do
		visit '/'
		expect(page).to have_content('You need to sign in or sign up before continuing.')
	end

	scenario 'cannot create a new post without logged in' do
		visit new_post_path
		expect(page).to have_content('You need to sign in or sign up before continuing.')
	end

end