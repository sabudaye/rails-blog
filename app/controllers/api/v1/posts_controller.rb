class Api::V1::PostsController < Api::V1::ApplicationController
  http_basic_authenticate_with :name => configus.admin.login,
    :password => configus.admin.pass,
    :except => [:index, :show]

  def index
    @posts = Post.published.all
    respond_with(@posts)
  end

  def show
    @post = Post.find(params[:id])
    respond_with(@post)
  end

  def create
    @post = PostType.new(params[:post])
    @post.save

    respond_with(@post)
  end

  def update
    @post = PostType.find(params[:id])
    @post.update_attributes(params[:post])
    respond_with(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with(@post)
  end
end
