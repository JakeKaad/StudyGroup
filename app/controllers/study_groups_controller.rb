class StudyGroupsController < ApplicationController
	before_action :set_study_group, only: [:show]

	def show
		@new_post = true if params[:new_post] == "true"
		@posts = @study_group.posts.each.sort_by { |post| post.created_at}.reverse 
	end

	def new
	end

	def create
		@course = find_joinable
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

	private

		def set_study_group
			@study_group = StudyGroup.find(params[:id])
		end
end