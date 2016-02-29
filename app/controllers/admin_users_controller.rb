class AdminUsersController < ApplicationController
  layout "admin"

  before_action :admin_logged_in_user
  before_action :admin_correct_user, only: [:edit,:update]
  before_action :admin_role_check, only: [:list,:new,:destroy,:create]


  def list
    @admin_users = AdminUser.paginate(page: params[:page])
  end

  def create
    @admin_user = AdminUser.new(user_params)
    if @admin_user.save
      # admin_log_in @admin_user
      flash[:success] = "Add new user Success"
      redirect_to admin_all_users_path
    else
      render 'new'
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def dashboard

  end

  def new
    @admin_user = AdminUser.new
  end

  def update
    @admin_user = AdminUser.find(params[:id])

    if @admin_user.authenticate(params[:admin_user][:old_password])
      if @admin_user.update_attributes(update_user_params)
        flash[:success] = "Profile updated"
        redirect_to edit_admin_user_path
      else
        render 'edit'
      end
    else
      @admin_user.errors[:base] << "wrong old password"
      render 'edit'
    end

  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to admin_all_users_url
  end

  def payment
    @admin_user = admin_current_user
    @bank_accounts = admin_current_user.bank_accounts.all
  end

  private

  def user_params
    params.require(:admin_user).permit(:username,:name,:email,:password,:password_confirmation)
  end

  def update_user_params
    params.require(:admin_user).permit(:username,:name,:email,:password,:password_confirmation)

  end

  def admin_correct_user
    @admin_user = AdminUser.find(params[:id])
    redirect_to admin_dashboard_path unless admin_current_user_check?(@admin_user)
  end

  def admin_role_check

    unless admin_current_user.admin?
      flash[:danger] = "Not admin"
      redirect_to admin_dashboard_path
    else

    end

  end

end
