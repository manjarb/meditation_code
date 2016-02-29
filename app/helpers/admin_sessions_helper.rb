module AdminSessionsHelper

  def admin_log_in(admin_user)
    session[:admin_user_id] = admin_user.id
  end

  def admin_current_user

    if admin_user_id = session[:admin_user_id]
      @admin_current_user || AdminUser.find_by(id: admin_user_id)
    elsif admin_user_id = cookies.signed[:admin_user_id]
      admin_user = AdminUser.find_by(id: admin_user_id)
      if admin_user && admin_user.authenticated?(:remember,cookies[:remember_token])
        admin_log_in(admin_user)
        @admin_current_user = admin_user
      end

    end
  end

  def admin_logged_in?
    !admin_current_user.nil?
  end

  def admin_logout
    helper_admin_forget(admin_current_user)
    session.delete(:admin_user_id)
    @admin_current_user = nil
  end

  def helper_admin_remember(admin_user)
    admin_user.AdminRemember
    cookies.permanent.signed[:admin_user_id] = admin_user.id
    cookies.permanent[:remember_token] = admin_user.remember_token
  end

  def helper_admin_forget(admin_user)
    admin_user.admin_forget
    cookies.delete(:admin_user_id)
    cookies.delete(:remember_token)
  end

  def admin_current_user_check?(admin_user)
    admin_user == admin_current_user
  end

end
