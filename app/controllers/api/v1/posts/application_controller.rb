class Api::V1::Posts::ApplicationController < Api::V1::ApplicationController
  def resource_post
    Post.published.find(params[:post_id])
  end
end