class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include AdminSessionsHelper
  include SessionsHelper
  include ApplicationHelper

  private

  def admin_logged_in_user
    unless admin_logged_in?
      #store_location
      flash[:danger] = "Pls login"
      redirect_to admin_login_path
    end
  end

  def logged_in_user
    unless logged_in?
      #store_location
      flash[:danger] = "Pls login"
      redirect_to login_url
    end
  end

end
