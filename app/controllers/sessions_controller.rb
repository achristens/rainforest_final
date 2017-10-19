class SessionsController < ApplicationController
  def new

  end

  def create
    u = User.find_by(email: params[:session][:email])

    # This is saying if the user was found with the above find_by AND the password is correct, then redirect to the homepage
    if u && u.authenticate(params[:session][:password])

      # The "wristband" aka cookie on the user using the session hash. It's a magic hash like params and flash
      session[:user_id] = u.id

      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    # Take off the "wristband"
    session[:user_id] = nil
    redirect_to root_url
  end
end
