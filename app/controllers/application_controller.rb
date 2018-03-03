class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Before any page loads find the current user
  # Since we define before action on the Application controller, because of class inheritance the return value can be used on the other pages as well
  before_action :find_current_user

  # Add in method to use in views
  helper_method :is_logged_in?

  def find_current_user
    # If logged in
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else # If it's not logged
      @current_user = nil
    end
  end


  def check_login # We put it into a separate method because we want to check it multiple places across the site calling before_action
    unless is_logged_in?
      redirect_to new_session_path
    end
  end

  def is_logged_in?
    session[:user_id].present?
  end

end
