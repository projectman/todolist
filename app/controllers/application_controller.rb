class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :ensure_login
  helper_method :signed_in?, :current_user

  protected
    def ensure_login
      # Always go to login page unless session contains user_id:
      # No user Id -> no login -> redirect_to login_path
      redirect_to login_path unless signed_in?
      
    end
    

    def current_user
      
      remember_token = User.encrypt(cookies[:remember_token])
      @current_user ||= User.find_by(remember_token: remember_token)      
    end
end
