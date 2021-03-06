class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate

      log_in(user)
      remember(user)
      flash[:success] = "Account activated!"

      redirect_to activities_url
    else
      flash[:danger] = "Invalid activation link"
      redirect_to activities_url

    end
  end

end
