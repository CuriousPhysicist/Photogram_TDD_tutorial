require 'rails_helper.rb'

feature 'Editing posts' do 

	background do
		post = create(:post)

		visit '/'
		find(:xpath, "//a[contains(@href, 'posts/1')]").click
		click_link 'Edit Post'
	end

	scenario 'Can edit a post' do
		fill_in 'Caption', with: "Oooops you weren't meant to see that!"
		click_button 'Update Post'

		expect(page).to have_content("Post Updated")
		expect(page).to have_content("Oooops you weren't meant to see that!")
	end

	scenario "won't update a post without an image" do
		attach_file('Image', 'spec/files/coffee.zip')
		click_button 'Update Post'

		expect(page).to have_content("There is something wrong with your form!")
	end

end