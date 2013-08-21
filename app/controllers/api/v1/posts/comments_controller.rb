class Api::V1::Posts::CommentsController < Api::V1::Posts::ApplicationController
  http_basic_authenticate_with :name => configus.admin.login,
    :password => configus.admin.pass,
    :except => [:index, :show]

  def index
    @coments = resource_post.comments.all

    respond_with(@comments)
  end

  def create
    @comment = PostCommentType.new(params[:post_comment])
    @comment.post = resource_post
    @comment.save

    respond_with(@comment)
  end

  def destroy
    @comment = resource_post.comments.find(params[:id])
    @comment.destroy

    respond_with(@comment)
  end
 end