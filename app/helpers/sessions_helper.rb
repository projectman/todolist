module SessionsHelper

  def sign_in(user)
  	remember_token = User.new_remember_token

  	# method of RoR that install 20.years.from_now exhaust of cookies
  	cookies.permanent[:remember_token] = remember_token

    # now we can update attribues of user without validation of password existence
  	user.update_attribute(:remember_token, User.encrypt(remember_token))

  	# if we need sign_in without redirect
  	self.current_user=user
  end

  # Check that user is logged in
  def logged_in?
    !current_user.nil?	 # nil is false
    
  end


  # Method 'current_user='
  def current_user=(user)
    @current_user = user
  end

  # Seach current user by remember_token
  def current_user
  	remember_token = User.encrypt(cookies[:remember_token])
  	@current_user ||= User.find_by(remember_token: remember_token)
  	
  end

end
