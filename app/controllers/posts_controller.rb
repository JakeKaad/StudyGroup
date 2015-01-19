class PostsController < ApplicationController
	before_action :set_post, except: [:index, :new, :create]
	before_action :require_enrollment, except: [:index, :new, :show]
	before_action :require_creator, only: [:edit, :update]


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
		
		if course?
			@post.postable = Course.find(params[:course_id])
		elsif study_group?
			@post.postable = StudyGroup.find(params[:study_group_id])
		end

		if course? && @post.save
			flash[:notice] = "Post created."
			redirect_to course_path(@post.postable)
		elsif study_group? && @post.save
			flash[:notice] = "Post created."
			redirect_to study_group_path(@post.postable)
		elsif course?
			flash[:error] = "Post not created."
			render '/courses/show'
		elsif study_group?
			flash[:error] = "Post not created."
			render '/study_groups/show'
		end
	end

	def edit
		@new_post = true
	end

	def update
		if course? && @post.update
			flash[:notice] = "Post created."
			redirect_to course_path(@post.postable)
		elsif study_group? && @post.update
			flash[:notice] = "Post created."
			redirect_to study_group_path(@post.postable)
		elsif course?
			flash[:error] = "Post not created."
			render '/courses/show'
		elsif study_group?
			flash[:error] = "Post not created."
			render '/study_groups/show'
		end
	end

	private

		def post_params
			params.require(:post).permit(:title, :body)
		end

		def set_post
			@post = Post.find_by(params[:slug])
		end

		def require_creator
			access_denied unless logged_in? && @post.creator == current_user
		end

end