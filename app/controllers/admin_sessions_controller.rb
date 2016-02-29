class AdminSessionsController < ApplicationController
  layout "admin"

  def new
  end

  def create

    admin_user = AdminUser.find_by(email: params[:admin_sessions][:email].downcase)

    if admin_user && admin_user.authenticate(params[:admin_sessions][:password])
      admin_log_in(admin_user)
      params[:admin_sessions][:admin_remember_me] == '1' ? helper_admin_remember(admin_user) : helper_admin_forget(admin_user)
      redirect_to admin_dashboard_path
    else
      flash.now[:danger] = "Invalid pass or user"
      render 'new'
    end
  end

  def destroy
    admin_logout if admin_logged_in?
    redirect_to admin_login_path
  end
end
