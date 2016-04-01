class BlogsController < ApplicationController

  layout "admin"

  def index

  end

  def new
    @post = Blog.new
  end

end
