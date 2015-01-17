class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by username: params[:username]

		if user && user.authenticate(params[:password])
			flash[:notice] = "Successfully logged in"
			session[:user_id] = user.id
			redirect_to root_path
		else
			flash[:error] = "User name or password entered incorrectly"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Successfully logged out."
		redirect_to root_path
	end

end
