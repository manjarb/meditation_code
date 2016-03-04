class ReviewsController < ApplicationController

  before_action :logged_in_user, only:[:create]
  before_action :check_robot_cut, only:[:create]
  before_action :check_redundent_comment, only:[:create]

  def create
    user_id = current_user.id
    user_name = current_user.username
    activity_id = params[:activity_id]

    @review = Review.new(activity_param)
    @review.user_id = user_id
    @review.username = user_name
    @review.activity_id = activity_id


    if @review.save
      flash[:success] = "Finished submit your review"
      redirect_to activity_show_path(user_id)
    else
      flash[:danger] = "Error submit your review please try again"
      redirect_to activity_show_path(user_id)
    end

  end

  private

  def activity_param
    params.require(:review).permit(:comment,:score)
  end

  def check_robot_cut
    if params[:review][:robot_cut].to_i != 21
      flash[:danger] = "Please provide correct number for the review question"
      redirect_to activity_show_path(params[:activity_id])
    end
  end

  def check_redundent_comment
    if review_find = Review.find_by(user_id: current_user.id,activity_id: params[:activity_id])
      flash[:danger] = "You are already reviewed this activity"
      redirect_to activity_show_path(params[:activity_id])
    end
  end

end
