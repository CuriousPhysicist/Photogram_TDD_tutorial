require 'rails_helper.rb'

feature 'Index displays a list of posts' do 

	background do
		post_one = create(:post, caption: "This is post one")
		post_two = create(:post, caption: "This is the second post")
		user = create :user

		visit '/'

		fill_in 'Email', with: 'rubinator@ruby.com'
		fill_in 'Password', with: 'illbeback'

		click_button 'Log in'
		
	end
	
	scenario 'index displays correct corrected post information' do

		expect(page).to have_content("This is post one")
		expect(page).to have_content("This is the second post")
		expect(page).to have_css("img[src*='coffee.jpeg']")
	end

end