class ReservationsController < ApplicationController

  before_action :logged_in_user,      only: [:create,:new]

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

    @activity = Activity.find_by(id: params[:activity_id])
    @user = current_user
    @quantity = params[:reservation][:quantity]
    @temple = Temple.find_by(id: @activity.temple_id)
    @params_create = params[:reservation]

    @reservation = Reservation.new(reservation_params)
    @reservation.payment_made = DateTime.now.to_date
    @reservation.payment_amount = @activity.payment_price * @quantity.to_i
    @reservation.activity_id = @activity.id
    @reservation.user_id = @user.id
    @reservation.confirm_email = params[:reservation][:confirm_email]

    if @reservation.save
      redirect_to activity_reservation_complete_path(@activity.id,@reservation.id)
    else
      #@reservation.errors[:base] << "Your email confirmation didn't match"
      render 'new'
    end
  end

  def complete

  end

  private

  def reservation_params
    params.require(:reservation).permit(:quantity,:firstname,:lastname,:email,:phone_number)
  end


end
