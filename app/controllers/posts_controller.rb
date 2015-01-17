class PostsController < ApplicationController
	before_action :set_post, except: [:index, :new]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	private

		def post_params
			params.require(:post).permit(:title, :body)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end