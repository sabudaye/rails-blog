class Web::PostsController < ApplicationController
  http_basic_authenticate_with :name => "dhh", :password => "secret", :except => [:index, :show]

  #TODO respond_to must be removed
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = PostType.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = PostType.new(params[:post])
    if @post.save
      f(:success)
      redirect_to @post
    else
      f(:error)
      render action: "new"
    end
  end

  def update
    @post = PostType.find(params[:id])
    if @post.update_attributes(params[:post])
      f(:success)
      redirect_to @post
    else
      f(:errors)
      render action: "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end
end