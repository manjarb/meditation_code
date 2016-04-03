SitemapGenerator::Sitemap.default_host = 'https://thaimeditationcenter.com/'


SitemapGenerator::Sitemap.create do

  # add '/home', :changefreq => 'daily', :priority => 0.9
  # add '/contact_us', :changefreq => 'weekly'

  #add '/' , :priority => 0.9
  add '/signup' , :priority => 0.9
  add '/login' , :priority => 0.9
  add '/articles' , :priority => 0.9
  add activities_list_path

  @temple_array = []
  @temple_counter_hash = {}

  Activity.find_each do |activity|

    add activity_show_path(activity.id), :lastmod => activity.created_at

    temple = Temple.find_by(id: activity.temple_id)

    if temple
      if @temple_counter_hash.has_key?(temple.city)
        #@temple_counter_hash[temple.city] += 1
      else
        @temple_counter_hash[temple.city] = 1
      end
    end

  end

  Blog.find_each do |blog|

    add blog_details_path(blog.id), :lastmod => blog.updated_at

  end

  @temple_counter_hash.each do |key,value|

    add activities_like_search_path(key)

  end


end

SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks