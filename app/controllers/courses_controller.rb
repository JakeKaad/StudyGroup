class CoursesController < ApplicationController
	before_action :set_course, except: [:index, :new, :create]
	before_action :require_user, except: [:index]

	def index
		@courses = Course.all
	end

	def show
		@new_post = true if params[:new_post] == "true"
		@posts = @course.posts.each.sort_by { |post| post.created_at}.reverse 
		@study_group = StudyGroup.new
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		@membership = Membership.new(joinable: @course, user_id: current_user.id, teacher: true)

		if @course.save
			@course.memberships << @membership
			flash[:notice] = "Course created."
			redirect_to course_path(@course)
		else
			flash[:error] = "Course not created"
			render :new
		end
	end

	def edit
	end

	def update
		if @course.update(course_params)
			@course.memberships << @membership
			flash[:notice] = "Course updated."
			redirect_to course_path(@course)
		else
			flash[:error] = "Course not created"
			render :edit
		end
	end

	def enroll
		@membership = Membership.new(joinable: @course, user_id: current_user.id, teacher: false)

		if @membership.save
			flash[:notice] = "Successfully enrolled in #{@course.name}"
			redirect_to course_path(@course)
		else
			flash[:notice] = "You can't enroll in that class"
			redirect_to root_path
		end
	end

	private

		def set_course
			@course = Course.find(params[:id])
		end

		def course_params
			params.require(:course).permit(:name, :description)
		end


end