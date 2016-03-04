require 'date'

class UsersController < ApplicationController

  before_action :redirect_login_page, only: [:new]
  before_action :logged_in_user,      only: [:edit,:update,:update_password,:user_tabs]
  before_action :correct_user,        only: [:edit,:update,:update_password]

  def new
    session[:referrer] = request.referrer
    @user = User.new
  end

  def create
    referrer  = session.delete(:referrer)
    @user = User.new(user_params)
    @user.login_type = "email"
    if @user.save
      # log_in @user
      # remember(@user)
      flash[:info] = "Please check your email to activate your account"
      @user.send_activation_email
      # redirect_to referrer || activities_url
      redirect_to login_url
    else
      flash.now[:danger] = "Your username or password is wrong."
      render 'new'
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def user_tabs

    @user = current_user

    if request.path == user_profile_path

    elsif request.path == user_settings_path

    elsif request.path == user_bookings_path
      @reservations = current_user.reservations.all

    elsif request.path == user_wishlist_path

    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(update_user_params)
      flash[:success] = "Profile updated"
      redirect_to user_profile_url
    else
      flash[:danger] = "Update Profile Fail"
      redirect_to user_profile_url
    end
  end

  def update_password
    @user = User.find(params[:id])

    if @user.authenticate(params[:user][:old_password])
      if @user.update_attributes(user_params)
        flash[:success] = "Password updated"
        redirect_to user_settings_url
      else
        flash[:danger] = "Update Profile Fail"
        redirect_to user_settings_url, :flash => { :error => @user.errors.full_messages.join(', ') }
      end
    else
      flash[:danger] = "Update Profile Fail"
      redirect_to user_settings_url, :flash => { :error => @user.errors.full_messages.join(', ') }
    end

  end

  private

  def user_params
    params.require(:user).permit(:username,:name,:email,:password,:password_confirmation,:login_type)
  end

  def update_user_params
    params.require(:user).permit(:username,:name,:email,:password,:password_confirmation,:phone_number,:birth_date,:address,:city,:zip_code,:country)
  end

  def redirect_login_page
    if logged_in?
      redirect_to activities_path
    end
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(activities_path) unless current_user?(@user)
  end

end
