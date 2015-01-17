class CoursesController < ApplicationController
	before_action :set_course, except: [:index, :new]

	def index
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

	def set_course
		@course = Course.find(params[:id])
	end


end