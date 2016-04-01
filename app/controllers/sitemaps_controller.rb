class SitemapsController < ApplicationController

  def index
    @activities = Activity.all
    @temple_array = []
    @temple_counter_hash = {}

    @activities.each do |activity|
      temple = Temple.find_by(id: activity.temple_id)

      if temple
        if @temple_counter_hash.has_key?(temple.city)
          #@temple_counter_hash[temple.city] += 1
        else
          @temple_counter_hash[temple.city] = 1
        end
      end

    end

  end

end
