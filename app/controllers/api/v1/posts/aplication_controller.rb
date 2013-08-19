class Api::V1:Posts::AplicationController < Api::V1::AplicationController
  def resource_post
    Post.find(paramsp[:post_id])
  end
end