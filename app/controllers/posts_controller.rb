class PostsController < ApplicationController
	before_action :set_post, except: [:index, :new, :create]

	def index
		@posts = Post.all.sort_by{ |post| post.created_at }.reverse
	end

	def show
	end

	def new
	end

	def create
		@post = Post.new(post_params)
		@post.creator = current_user

		if !params[:course_id].blank?
			@post.postable = Course.find(params[:course_id])
		end

		if @post.save
			flash[:notice] = "Post created."
			redirect_to course_path(@post.postable)
		else
			render course_path(@post)
		end
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