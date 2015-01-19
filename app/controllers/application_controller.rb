class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper_method :current_user, :logged_in?, :teacher?, :enrolled?, :find_joinable, :course?, :study_group?

  def logged_in?
  	!!current_user
  end

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id])
  end

  def require_user
    access_denied unless logged_in?
  end

  def teacher?
    logged_in? && @course.teacher == current_user
  end

  def require_teacher
    access_denied unless logged_in? && teacher?
  end

  def enrolled?(course)
    course.memberships.find_by(user_id: current_user.id)
  end

  def require_enrollment
    access_denied unless logged_in? && enrolled?(find_joinable)
  end

  def access_denied
    flash[:error] = "You aren't allowed to do that."
    redirect_to root_path
  end

  def course?
    Course.find_by slug: params[:course_id]
  end

  def study_group?
    StudyGroup.find_by slug: params[:study_group_id]
  end

  def find_joinable
    if course?
      Course.find_by slug: params[:course_id]
    elsif study_group?
      StudyGroup.find_by slug: params[:study_group_id]
    end
  end


  protect_from_forgery with: :exception
end
