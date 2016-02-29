class TemplesController < ApplicationController
  layout "admin"

  before_action :admin_logged_in_user
  before_action :admin_correct_user, only:[:destroy,:update,:edit]

  def create
    @temple = admin_current_user.temples.build(temple_params)
    if @temple.save
      flash[:success] = "Temple Created!"
      redirect_to admin_temples_url
    else
      render 'new'
    end

  end

  def new
    @temple = Temple.new
  end

  def edit

  end

  def update
    if @temple.update_attributes(temple_params)
      flash[:success] = "Temple updated"
      redirect_to edit_temple_path
    else
      render 'edit'
    end
  end

  def destroy
    @temple.destroy
    flash[:success] = "Temple Deleted"
    redirect_to admin_temples_url
  end

  def list
    @temples = admin_current_user.temples.paginate(page: params[:page])
  end

  private

  def temple_params
    params.require(:temple).permit(:name,:logo_url,:slogan,:address,:map_image_url,
                                   :phone_number,:email,:website,:latitude,:longitude,
                                   :temple_image01,:temple_image02,:temple_image03,
                                   :temple_image04,:temple_image05,:temple_image06,
                                   :facebook_url,:country,:city,:country_code,:start_at,:end_at)
  end

  def admin_correct_user
    @temple = admin_current_user.temples.find_by(id: params[:id])
    redirect_to admin_temples_url if @temple.nil?
  end

end
