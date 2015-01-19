class StudyGroupsController < ApplicationController
	before_action :set_study_group, only: [:show, :enroll]
	before_action :require_member, only: [:show]
	before_action :require_course_enrollment, only: [:enroll]

	def show
		@new_post = true if params[:new_post] == "true"
		@posts = @study_group.posts.each.sort_by { |post| post.created_at}.reverse 
	end

	def new
	end

	def create
		@course = Course.find_by id: params[:course_id]
		@study_group = StudyGroup.new(params.require(:study_group).permit(:name, :description))
		@study_group.course = @course

		if @study_group.save
			flash[:notice] = "Study Group created."
			redirect_to course_path(@course, tab: "study_groups")
		else
			flash[:error] = "Something went wrong"
			render 'courses/show'
		end
	end

	def enroll
		@membership = Membership.new(joinable: @study_group, user_id: current_user.id)

		if @membership.save
			flash[:notice] = "Successfully joined #{@study_group.name}"
			redirect_to study_group_path(@study_group)
		else
			flash[:error] = "You can't join that Study Group"
			redirect_to root_path
		end
	end

	private

		def set_study_group
			@study_group = StudyGroup.find_by slug: params[:id]
		end

		def member?
			@study_group.memberships.find_by(user_id: current_user.id)
		end

		def require_member
			access_denied unless member?
		end

		def require_course_enrollment
			@study_group.course.memberships.find_by(user_id: current_user.id)
		end

end