class ApplicationController < ActionController::Base
  helper_method :current_user

  def authentication_required
    if !logged_in?
      redirect_to login_path, alert: "Please login to visit that page."
    end
  end

  def logged_in?
    !!current_user                #session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
