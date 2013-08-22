class Web::Posts::ApplicationController < Web::ApplicationController
  def resource_post
    Post.find(params[:post_id],
      :conditions => [ "state = ?", "public"])
  end
end