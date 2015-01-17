class CoursesController < ApplicationController
	before_action :set_course, except: [:index, :new]

	def index
		@courses = Course.all
	end

	def show
		@new_post = true if params[:new_post] == "true"
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def set_course
		@course = Course.find(params[:id])
	end


end