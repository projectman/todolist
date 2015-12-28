
class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  
  include SessionsHelper

  def new
  end

  def create
    # Find user by :username, taken from params created form from new.html.erb
    user = User.find_by(username: params[:session][:username].downcase)

    password = params[:session][:password]

    if user && user.authenticate(password)
      # !!! session[:user_id] = user.id
      
      sign_in user
      redirect_to root_path, notice: "Signed in successfully"
    else
      
      redirect_to login_path, alert: 'Invalid email/password combination'
    end
  end

  def destroy
  	sign_out
  	redirect_to login_path, notice: "You have been Signed out"
  end
end
