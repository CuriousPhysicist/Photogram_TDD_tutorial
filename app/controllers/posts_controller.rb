class PostsController < ApplicationController

	before_action :authenticate_user!

	def index
		@post = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)

		if @post.save
			flash[:success] = "Your post has been saved"
			redirect_to @post
		else
			flash[:alert] = "You need an image to complete the post!"
			render :new
		end

	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			flash[:success] = "Post Updated"
			redirect_to post_path(@post)
		else
			flash.now[:alert] = "There is something wrong with your form!"
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])

		if @post.destroy
			flash[:success] = "Problem solved! Post deleted."
			redirect_to root_path
		else
			flash[:alert] = "Ooops something went wrong"
			render :edit
		end
	end

	private

	def post_params
		params.require(:post).permit(:caption, :image)
	end

end
