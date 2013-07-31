class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :login_required
  respond_to :html


  def logged_in?
    session[:logged_in] == true
  end
  helper_method :logged_in?


  private

  def login_required
    unless logged_in?
      session[:return_to] = request.fullpath
      redirect_to admin_login_path and return false
    end
  end
end
