module ActivitiesHelper

  def temple_belong_list
    @temples = admin_current_user.temples
    temple_name_list = []
    @temples.each { |temple|
      temple_each_array = [temple.name,temple.id]
      temple_name_list << temple_each_array
    }

    return temple_name_list
  end

  def temple_belong_search(temple_id)
    @temple = Temple.find_by(id:temple_id)
    @temple.name
  end

  def parse_youtube(url)
    regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
    url.match(regex)[1]
  end

end
