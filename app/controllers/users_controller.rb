class UsersController < ApplicationController
	before_action :set_user, except: [:index, :new, :create]
  before_action :require_owner, only: [:edit, :update]

	def index
		@users = User.all
	end

	def show;
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:notice] = "Profile successfully created"
      session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		flash[:notice] = "Profile successfully updated"
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:username, :password, :password_confirmation)
  	end

  	def set_user
  		@user = User.find_by slug: params[:id]
  	end

    def require_owner
      access_denied unless current_user == @user
    end

end