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
		
		if params[:course_id]
			@post.postable = Course.find(params[:course_id])
		elsif params[:study_group_id]
			@post.postable = StudyGroup.find(params[:study_group_id])
		end

		if @post.save
			flash[:notice] = "Post created."
			if params[:course_id]
				redirect_to course_path(@post.postable)
			elsif params[:study_group_id]
				redirect_to study_group_path(@post.postable)
			end
		else
			if params[:course_id]
				flash[:error] = "Post not created."
				render '/courses/show'
			elsif params[:study_group_id]
				flash[:error] = "Post not created."
				render '/study_groups/show'
			end
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