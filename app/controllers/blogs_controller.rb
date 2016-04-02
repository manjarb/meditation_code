class BlogsController < ApplicationController

  layout "admin"

  before_action :admin_logged_in_user
  before_action :admin_correct_user, only:[:destroy,:update,:edit]

  def index
    @blogs = Blog.all.paginate(page: params[:page])
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

      tag_update_func(tag_array)

      #byebug

      redirect_to blogs_url
    else
      render 'new'
    end

  end

  def edit

    @tag = []

    tag_array_element = @blog.tags

    tag_array_element.each do |tag|
      @tag << tag.name
    end

    @tag = @tag.join(",")

  end

  def update

    tag_array = tags_params[:name].split(/\s*,\s*/)

    if @blog.update_attributes(blog_params)
      flash[:success] = "Post updated"
      tag_update_func_for_update_post_content(tag_array)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    flash[:success] = "Temple Deleted"
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title,:content)
  end

  def tags_params
    params.require(:tag).permit(:name)
  end

  def tag_update_func(tag_array)
    tag_array.each do |tag|

      tag_find = Tag.find_by(name: tag)

      unless tag_find
        #Tag.create!(name: tag)
        tag_save = Tag.new(name: tag)
        tag_save.blogs << @blog
        tag_save.save
      else

        tag_find.blogs << @blog
        tag_find.save

      end

    end
  end

  def tag_update_func_for_update_post_content(tag_array)
    tag_array.each do |tag|

      tag_relation = @blog.tags.find_by(name: tag)

      unless tag_relation

        tag_find = Tag.find_by(name: tag)

        unless tag_find
          tag_save = Tag.new(name: tag)
          tag_save.blogs << @blog
          tag_save.save

        else
          tag_find.blogs
          tag_find.save

        end

      else

      end

    end
  end

  def admin_correct_user
    @blog = admin_current_user.blogs.find_by(id: params[:id])
    redirect_to admin_temples_url if @blog.nil?
  end

end
