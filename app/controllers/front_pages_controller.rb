class FrontPagesController < ApplicationController

  def index
    @activities = Activity.all.limit(6)
    @temple_array = []
    @temple_counter_hash = {}
    @activities_count = @activities.count
    @activities_per_row = (@activities_count / 3).ceil
    @activities.each { |activity|
      # cities_array = activity.city

      temple = Temple.find_by(id: activity.temple_id)
      #temple_array << temple.city

      if temple
        if @temple_counter_hash.has_key?(temple.city)
          @temple_counter_hash[temple.city] += 1
        else
          @temple_counter_hash[temple.city] = 1
        end
      end
    }
  end

  def activities_list
    @activities = Activity.all.paginate(:page => params[:page], :per_page => 10)
    @temples = Temple

    render 'list'
  end

  def activities_details

    id = params[:id]
    @activity = Activity.find_by(id: id)
    @temple = Temple.find_by(id: @activity.temple_id)
    @reviews = Review.where(activity_id: id).limit(5).order(created_at: :desc)
    @reviews_data = Review.where(activity_id: id)
    @reviews_count = @reviews_data.count

    sum_review_score = 0

    if @reviews_count > 0
      @reviews_data.each { |review_data|
        sum_review_score = sum_review_score + review_data.score
      }

      @reviews_level = (sum_review_score / @reviews_count).round(1)
    else

    end





    render :template => 'front_pages/activity_details'
  end

end
