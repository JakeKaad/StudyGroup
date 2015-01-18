class StudyGroupsController < ApplicationController
	before_action :set_study_group, only: [:show]

	def show
		@new_post = true if params[:new_post] == "true"
		@posts = @study_group.posts.each.sort_by { |post| post.created_at}.reverse 
	end

	def new
	end

	def create
	end

	private

		def set_study_group
			@study_group = StudyGroup.find(params[:id])
		end
end