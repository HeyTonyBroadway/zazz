class PostsController < ApplicationController

	before_action find_post, :only [:edit, :show, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)

		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def edit
		@post = Post.edit
	end

	def update
		@post = Post.update(post_params)
	end

	def show
	end

	def destroy
		@post = Post.delete
	end

	private

	def post_params
		params.require(:posts).permit(:title, :description)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end