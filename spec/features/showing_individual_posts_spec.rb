require 'spec_helper.rb'

feature 'Can view individual posts' do 
	
	background do
		post = create(:post)
		user = create :user

		sign_in_with user
		
	end


	scenario 'Can click and view a single post' do
		
		post = Post.first

		find(:xpath, "//a[contains(@href, 'posts/1')]").click
		expect(page.current_path).to eq(post_path(post))
	end
	
end