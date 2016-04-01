class BlogsController < ApplicationController

  layout "admin"

  before_action :admin_logged_in_user

  def index

  end

  def new
    @blog = Blog.new
  end

  def create

    @blog = admin_current_user.blogs.build(blog_params)

    tag_array = tags_params[:name].split(/\s*,\s*/)

    #@tag = @blog.tags.build()

    if @blog.save
      flash[:success] = "Post Created!"

      tag_array.each do |tag|

        tag_find = Tag.find_by(name: tag)

        unless tag_find
          #Tag.create!(name: tag)
          tag_save = Tag.new(name: tag)
          tag_save.blogs << @blog
          tag_save.save

        end

      end

      #byebug

      redirect_to blogs_url
    else
      render 'new'
    end

  end

  private

  def blog_params
    params.require(:blog).permit(:title,:content)
  end

  def tags_params
    params.require(:tag).permit(:name)
  end

end
