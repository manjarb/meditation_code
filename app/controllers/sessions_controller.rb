class SessionsController < ApplicationController

  before_action :redirect_login_page, only: [:new]

  def new
    session[:referrer] = request.referrer
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in(user)
        remember(user)
        if session[:referrer]
          referrer  = session.delete(:referrer)
          redirect_to referrer || activities_url
        else
          redirect_to request.referrer
        end
      else
        message = "Account not activated <br>"
        message += "Check your email for the activation link"

        flash.now[:info] = message.html_safe

        render 'new'
      end

    else
      flash.now[:danger] = "Your username or password is wrong."
      render 'new'
    end

  end

  def facebook_create
    user = User.from_omniauth(env["omniauth.auth"])
    log_in(user)
    remember(user)
    if session[:referrer]
      referrer  = session.delete(:referrer)
      redirect_to referrer || activities_url
    else
      redirect_to request.referrer
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to activities_url
  end

  private

  def redirect_login_page
    if logged_in?
      redirect_to activities_path
    end
  end

end
