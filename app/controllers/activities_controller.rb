require 'date'

class ActivitiesController < ApplicationController
  layout 'admin'

  before_action :admin_logged_in_user
  before_action :admin_correct_user, only:[:destroy,:update,:edit]
  before_action :permanent_event_convert, only:[:create,:update]

  def list
    @activities = admin_current_user.activities.paginate(page: params[:page]).order(created_at: :desc)
  end

  def edit

  end

  def update
    if @activity.update_attributes(activity_param)
      flash[:success] = "Activity updated"
      redirect_to edit_activity_url
    else
      render 'edit'
    end
  end

  def create
    @activity = admin_current_user.activities.build(activity_param)
    #@activity = admin_current_user.activities.create(activity_param)
    if @activity.save
      flash[:success] = "Activity Created!"
      redirect_to admin_dashboard_url
    else
      render 'new'
    end
  end

  def new
    @activity = Activity.new
  end

  def destroy
    @activity.destroy
    flash[:success] = "Activity Deleted"
    redirect_to admin_dashboard_url
  end

  private

  def activity_param
    params.require(:activity).permit(:name,:details,
                                     :activity_image01_url,:activity_image02_url,:activity_image03_url,
                                     :youtube_url,:capacity,:booking_status,:rules,:apply_details,
                                     :payment_price,:payment_need,:avaliable,:rating,:temple_id,:permanent,
                                     :start_at,:end_at)
  end

  def admin_correct_user
    @activity = admin_current_user.activities.find_by(id: params[:id])
    redirect_to admin_dashboard_url if @activity.nil?
  end

  def permanent_event_convert

    param_var = params[:activity]
    if param_var[:permanent] == 'false'

      unless param_var[:start_at] == ""
        #params[:activity][:start_at] = param_var[:start_at].gsub("/","-")
        params[:activity][:start_at] = Date.strptime(param_var[:start_at], "%m/%d/%Y")

      end

      unless param_var[:end_at] == ""
        #params[:activity][:end_at] = param_var[:end_at].gsub("/","-")
        params[:activity][:end_at] = Date.strptime(param_var[:end_at], "%m/%d/%Y")

      end

    end
  end

end
