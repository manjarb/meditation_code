class FrontPagesController < ApplicationController

  def index
    @all_activities_index = Activity.all.order(created_at: :desc)
    @activities = @all_activities_index.limit(6)
    @temple_array = []
    @temple_counter_hash = {}
    @activities_count = @activities.count
    @activities_per_row = (@activities_count / 3).ceil

    if @activities_per_row < 1
      @activities_per_row = 1
    end

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

    @all_activities_pure = return_all_activities_by_order

    if params.has_key?(:rank)
      rank_search = params[:rank]
      @all_activities = @all_activities_pure.where("rating >= ?",rank_search)
    else
      @all_activities = @all_activities_pure
    end

    @activities = @all_activities.paginate(:page => params[:page], :per_page => 10)
    @temples = Temple

    @superb_count = 0
    @very_good_count = 0
    @good_count = 0
    @pleasant = 0
    @no_rating = 0

    activities_rating_return(@all_activities_pure)

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

    @reservation = Reservation.new
    @review = Review.new

    sum_review_score = 0

    if @reviews_count > 0
      @reviews_data.each { |review_data|
        sum_review_score = sum_review_score + review_data.score
      }

      @reviews_level = (sum_review_score / @reviews_count).round(1)
    else

    end

    @wishlist = Wishlist.find_by(user_id: current_user.id,activity_id: @activity.id)

    render :template => 'front_pages/activity_details'
  end

  def cities_search

    rank_search = ""

    # if params.has_key?(:front_pages)
    #   @city_name = params[:front_pages][:cityname]
    # elsif params.has_key?(:cityname)
    #   @city_name = params[:cityname]
    # else
    #   @city_name = ""
    # end

    if params.has_key?(:front_pages)
      @city_name = params[:front_pages][:cityname]
      @city_key = return_city_key_by_name(@city_name)
    elsif params.has_key?(:cityname)

      @city_key = params[:cityname]
      @city_name = return_city_by_key(@city_key)

    else
      @city_name = ""
      @city_key = return_city_key_by_name(@city_name)
    end

    #@city_key = return_city_key_by_name(@city_name)

    @superb_count = 0
    @very_good_count = 0
    @good_count = 0
    @pleasant = 0
    @no_rating = 0

    @activities_all = return_all_activities_by_order

    if @city_key.nil? || Temple.find_by(city: @city_key).nil?
      @temples = Temple
      #@activities_for_count = Activity.all
      actvities_where = @activities_all
      @activities = @activities_all.paginate(:page => params[:page], :per_page => 10)

      puts "@city_nameheree"
      puts @city_key
      puts "@citykey_here"
      puts @city_name

      if @city_name != ""
        flash.now[:info] = "No Search result for " + @city_name
      else
        flash.now[:info] = "No Search result"
      end

    else

      @temples_search_all = Temple.where(city: @city_key)
      @temples_search = []

      @temples_search_all.each do |temple_search|
        @temples_search << temple_search.id
      end

      actvities_where = Activity.where(temple_id: @temples_search)

      if params.has_key?(:rank)
        rank_search = params[:rank]
        activities_connect = actvities_where.where("rating >= ?",rank_search)
      else
        activities_connect = actvities_where
      end

      if params.has_key?(:orderby)
        order_met = params[:orderby]

        if order_met == "rankhigh"
          @activities_for_count = activities_connect.order(rating: :desc)
        elsif order_met == "ranklow"
          @activities_for_count = activities_connect.order(rating: :asc)
        else
          @activities_for_count = activities_connect.order(created_at: :desc)
        end

      else
        @activities_for_count = activities_connect.order(created_at: :desc)
      end

      @activities = @activities_for_count.paginate(:page => params[:page], :per_page => 10)

      @temples = Temple
    end

    activities_rating_return(actvities_where)

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

      @no_rating += 1

      if activity.rating.nil?

      elsif activity.rating >= 9
        @superb_count += 1
        @very_good_count += 1
        @good_count += 1
        @pleasant += 1
      elsif activity.rating >= 8
        @very_good_count += 1
        @good_count += 1
        @pleasant += 1
      elsif activity.rating >= 7
        @good_count += 1
        @pleasant += 1
      elsif activity.rating >= 6
        @pleasant += 1
      end
    }
  end

end
