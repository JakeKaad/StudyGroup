class UsersController < ApplicationController
	before_action :set_user, except: [:index, :new]

	def index
		@users = User.all
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

  	def user_params
  		params.require(:user).permit(:username, :password, :password_confirmation)
  	end

  	def set_user
  		@user = User.find(params[:id])
  	end

end