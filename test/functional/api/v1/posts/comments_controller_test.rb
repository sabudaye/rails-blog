require 'test_helper'

class Api::V1::Posts::CommentsControllerTest < ActionController::TestCase
  setup do
    #TODO move it on helper
    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials(configus.admin.login, configus.admin.pass)

    @comment = create 'post/comment'
    @post = @comment.post
    @params = { post_id: @post.id}
  end

  test "should get list of comments" do
    get :index, @params.merge(format: :json)
    assert_response :success
  end

  test "should create comment" do
    attrs = attributes_for 'post/comment'

    post :create, @params.merge(post_comment: attrs, format: :json)
    assert_response :success
  end

  test "should destroy comment" do
    delete :destroy, @params.merge(id: @comment.id, format: :json)
    assert !Post::Comment.exists?(@comment)
    assert_response :success
  end
end