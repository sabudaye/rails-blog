class Web::Posts::ApplicationController < Web::ApplicationController
  def resource_post
    Post.published.find(params[:post_id])
  end
end