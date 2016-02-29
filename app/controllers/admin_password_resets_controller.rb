class AdminPasswordResetsController < ApplicationController
  layout "admin"

  before_action :get_user,    only: [:edit, :update]
  before_action :valid_user,  only: [:edit, :update]
  before_action :check_expiration,  only: [:edit, :update]

  def new
  end

  def edit
  end

  def update
    if password_blank?
      flash.now[:danger] = "Password cannot blank"
      render 'edit'
    elsif @admin_user.updateattributes(user_params)
      admin_log_in(@admin_user)
      flash[:success] = "Password has been reset"
      redirect_to @admin_user
    else
      render 'edit'
    end
  end

  def create
    @admin_user = AdminUser.find_by(email: params[:admin_password_resets][:email].downcase)
    if @admin_user
      @admin_user.create_reset_digest
      @admin_user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to admin_login_path
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  private

  def get_user
    @admin_user = AdminUser.find_by(email: params[:email])
  end

  def valid_user
    unless (@admin_user && @admin_user.activated? &&
        @admin_user.authenticated?(:reset,params[:id]))
      redirect_to admin_login_url
    end
  end

  def user_params
    params.require(:admin_user).permit(:password,:password_confirmation)
  end

  def password_blank?
    params[:user][:password].blank?
  end

  def check_expiration
    if @admin_user.password_reset_expired?
      flash[:danger] = "Password reset has expired"
      redirect_to new_admin_password_reset_url
    end
  end

end
