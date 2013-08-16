class Web::Posts::CommentsController < Web::ApplicationController
  http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy

  #TODO add flashes
  def create
    @post = Post.find(params[:post_id])
    if @post.comments.create(params[:post_comment])
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end
 end