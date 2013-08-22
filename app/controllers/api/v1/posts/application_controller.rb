class Api::V1::Posts::ApplicationController < Api::V1::ApplicationController
  def resource_post
    Post.find(params[:post_id],
      :conditions => [ "state = ?", "public"])
  end
end