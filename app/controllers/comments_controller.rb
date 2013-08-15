

class CommentsController < ApplicationController
  #TODO change controllers hierarchy
  http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:post_comment])
    redirect_to post_path(@post)
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
end