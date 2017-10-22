class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Take the name of a method as an argument and returns it in the view:
    helper_method(:current_user)

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in first"
      redirect_to new_sessions_url
    end
  end

  def create_cookie
    cookies[:original_referrer] = request.original_url
  end
end
