class WishlistsController < ApplicationController

  before_action :logged_in_user , only: [:create,:destroy]
  before_action :correct_user_for_wist_list , only: [:create,:destroy]

  def create
    activity_id = params[:wishlist_id]
    #user_id = params[:user_id]

    activity = Activity.find_by(id: activity_id)
    activity_name = activity.name

    wishlist = Wishlist.new
    wishlist.user_id = current_user.id
    wishlist.activity_id = activity.id
    wishlist.activity_name = activity.name

    if wishlist.save
      flash[:success] = "Success created a wishlist for this activity"
      redirect_to activity_show_url(activity.id)
    else
      flash[:danger] = "Error created a wishlist for this activity please try agian"
      redirect_to activity_show_url(activity.id)
    end

  end

  def destroy

    @wishlist = Wishlist.find_by(user_id: current_user.id,activity_id: params[:wishlist_id])

    if @wishlist.destroy
      flash[:success] = "Wishlist Deleted"
      redirect_to user_wishlist_url
    else
      flash[:danger] = "Error delete a Wishlist"
      redirect_to user_wishlist_url
    end
  end

  private

  def correct_user_for_wist_list
    @user = User.find_by(id: params[:user_id])
    redirect_to(activities_list_path) unless current_user?(@user)
  end

end
