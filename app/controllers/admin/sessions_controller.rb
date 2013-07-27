require 'digest/sha1'

class Admin::SessionsController < ApplicationController
  layout 'admin'

  def new
    redirect_to admin_root_path, notice: "You are already logged in." if logged_in?
  end

  def create
    if Digest::SHA1.hexdigest(params[:username]) == ADMIN_USERNAME &&
    Digest::SHA1.hexdigest(params[:password])    == ADMIN_PASSWORD
      session[:logged_in] = true
      redirect_to session[:return_to] || admin_root_path, notice: 'Logged in.'
      session[:return_to] = nil
    else
      redirect_to admin_login_path, alert: "Wrong info."
    end
  end

  #--------------------
  
  def destroy
    session[:logged_in] = nil
    redirect_to admin_root_path, notice: "Logged out."
  end
end
