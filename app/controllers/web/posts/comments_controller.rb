class Web::Posts::CommentsController < Web::Posts::ApplicationController
  http_basic_authenticate_with :name => configus.admin.login,
    :password => configus.admin.pass,
    :except => [:index, :show]

  def create
    @comment = PostCommentType.new(params[:post_comment])
    @comment.post = resource_post
    if @comment.save
      f(:success)
      redirect_to post_path(resource_post)
    else
      f(:error)
      redirect_to post_path(resource_post)
    end
  end

  def destroy
    @comment = resource_post.comments.find(params[:id])
    if @comment.destroy
      f(:success)
      redirect_to post_path(resource_post)
    else
      f(:error)
      redirect_to post_path(resource_post)
    end
  end
 end