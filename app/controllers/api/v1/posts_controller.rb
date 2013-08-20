class Api::V1::PostsController < Api::V1::ApplicationController
  http_basic_authenticate_with :name => "dhh",
    :password => "secret",
    :except => [:index, :show]

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @post = Post.find(params[:id])
    respond_with(@post)
  end

  def create
    @post = PostType.new(params[:post])
    if @post.save
      head 201
    else
      respond_with(@post)
    end
  end

  def update
    @post = PostType.find(params[:id])
    if @post.update_attributes(params[:post])
      head 205
    else
      respond_with(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      head 205
    else
      respond_with(@post)
    end
  end
end
