class Web::PostsController < ApplicationController
  http_basic_authenticate_with :name => configus.admin.login,
    :password => configus.admin.pass,
    :except => [:index, :show]

  add_breadcrumb :index, :posts_path

  def index
    @posts = Post.published.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.scoped.arrange(order: :created_at)
    @comment = PostCommentType.new(parent_id: params[:parent_id])

    add_breadcrumb @post.id, posts_path(@post)
  end

  def new
    @post = PostType.new
  end

  def edit
    @post = Post.find(params[:id])
    add_breadcrumb @post.id, posts_path(@post)
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
