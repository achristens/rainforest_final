class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# Take the name of a method as an argument and returns it in the view:
  helper_method(:current_user)

    def current_user
      session[:user_id] && User.find(session[:user_id])
    end

end
