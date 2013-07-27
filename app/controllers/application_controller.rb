class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_required
    unless logged_in?
      session[:return_to] = request.fullpath
      redirect_to admin_login_path and return false
    end
  end

  #--------------------
  
  def logged_in?
    session[:logged_in] == true
  end
  helper_method :logged_in?

end
