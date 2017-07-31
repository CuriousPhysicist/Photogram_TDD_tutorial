require 'rails_helper.rb'

feature 'Creating Posts' do
	scenario 'can create a post' do
		visit '/'
		click_link 'New Post'
		attach_file(' Image', "spec/files/images/coffee.jpeg")
		fill_in 'Caption', with: 'nom nom nom #coffeetime'
		click_button 'Create Post'
		expect(page).to have_content('#coffeetime')
		expect(page).to have_css("img[src*='coffee.jpeg']")
	end

	it 'needs an image to create a post' do
		# visit the root route
		# Click the 'New Post' link
		# Fill in the caption field (without touching the image field)
		# Click the 'Create Post' button
		# Expect the page to say 'You need an image to complete the post!'

		visit '/'
		click_link 'New Post'
		fill_in 'Caption', with: 'I hate pictures, let me post...'
		click_button 'Create Post'
		expect(page).to have_content('You need an image to complete the post!')

	end
end