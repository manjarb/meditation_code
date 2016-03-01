class FrontPagesController < ApplicationController

  def index
    @all_activities_index = Activity.all.order(created_at: :desc)
    @activities = @all_activities_index.limit(6)
    @temple_array = []
    @temple_counter_hash = {}
    @activities_count = @activities.count
    @activities_per_row = (@activities_count / 3).ceil
    @all_activities_index.each { |activity|

      temple = Temple.find_by(id: activity.temple_id)


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


    @all_activities = return_all_activities_by_order

    @activities = @all_activities.paginate(:page => params[:page], :per_page => 10)
    @temples = Temple

    @superb_count = 0
    @very_good_count = 0
    @good_count = 0
    @pleasant = 0
    @no_rating = 0

    activities_rating_return(@all_activities)

    @temple_counter_hash = {}
    @activities_count = @all_activities.count

    @all_activities.each { |activity|
      temple = Temple.find_by(id: activity.temple_id)

      if temple
        if @temple_counter_hash.has_key?(temple.city)
          @temple_counter_hash[temple.city] += 1
        else
          @temple_counter_hash[temple.city] = 1
        end
      end

    }

    render 'list'
  end

  def activities_details

    id = params[:id]
    @activity = Activity.find_by(id: id)

    @temple = Temple.find_by(id: @activity.temple_id)


    @reviews_data = Review.where(activity_id: id)
    @reviews = @reviews_data.limit(5).order(created_at: :desc)

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

  def cities_search

    if params.has_key?(:front_pages)

      @city_name = params[:front_pages][:cityname]
    elsif params.has_key?(:cityname)
      @city_name = params[:cityname]
    else
      @city_name = ""
    end

    puts "@uow-esunoe-ueo-sunoesut@city_name@city_name@city_name"
    puts @city_name

    @city_key = return_city_key_by_name(@city_name)

    @superb_count = 0
    @very_good_count = 0
    @good_count = 0
    @pleasant = 0
    @no_rating = 0

    @activities_all = return_all_activities_by_order

    if @city_key.nil?
      @temples = Temple
      #@activities_for_count = Activity.all
      @activities = @activities_all.paginate(:page => params[:page], :per_page => 10)

      flash.now[:info] = "No Search result for " + @city_name

    else

      @temples_search = Temple.find_by(city: @city_key)

      if params.has_key?(:orderby)
        order_met = params[:orderby]

        if order_met == "rankhigh"
          puts "RANK HIGhhhhhh"

          @activities_for_count = Activity.where(temple_id: @temples_search.id).order(rating: :desc)
        elsif order_met == "ranklow"
          puts "RANK HIGlllllllll"

          @activities_for_count = Activity.where(temple_id: @temples_search.id).order(rating: :asc)
        else
          puts "NOOOOO RANK"

          @activities_for_count = Activity.where(temple_id: @temples_search.id).order(created_at: :desc)
        end

      else
        puts "NOOOOO RANK"
        @activities_for_count = Activity.all.order(created_at: :desc)
      end



      @activities = @activities_for_count.paginate(:page => params[:page], :per_page => 10)

      @temples = Temple
    end

    activities_rating_return(@activities)

    @temple_counter_hash = {}
    @activities_count = @activities_all.count

    @activities_all.each { |activity|
      temple = Temple.find_by(id: activity.temple_id)

      if temple
        if @temple_counter_hash.has_key?(temple.city)
          @temple_counter_hash[temple.city] += 1
        else
          @temple_counter_hash[temple.city] = 1
        end
      end

    }

    #puts @temples

    render 'list'
  end

  private

  def activities_rating_return(activities)
    activities.each { |activity|

      if activity.rating.nil?
        @no_rating += 1
      elsif activity.rating >= 9
        @superb_count += 1
      elsif activity.rating >= 8
        @very_good_count += 1
      elsif activity.rating >= 8
        @good_count += 1
      elsif activity.rating >= 6
        @pleasant += 1
      else
        @no_rating += 1
      end
    }
  end

end
