class ReservationsController < ApplicationController

  def new
    @activity_id = params[:activity_id]
    @quantity = params[:reservation][:quantity]
    @activity = Activity.find_by(id: @activity_id)
    @temple = Temple.find_by(id: @activity.temple_id)
    @reservation = Reservation.new
    @user = current_user
  end

  def create
    #@reservation.errors[:base] << "wrong old password"
  end

end
