class ApplicationController < ActionController::Base
  helper_method :current_user

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end



end
