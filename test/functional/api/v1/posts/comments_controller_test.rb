require 'test_helper'

class Api::V1::Posts::CommentsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials(configus.admin.login, configus.admin.pass)
    @comment = create 'post/comment'
  end

  test "should get list of comments" do
    get :index, post_id: @comment.post_id, format: :json
    assert_response :success
  end

  test "should create comment" do
    post :create, post_id: @comment.post_id, post_comment: { body: @comment.body,
      commenter: @comment.commenter }, format: :json
    assert_response :success
  end

  test "should destroy comment" do
    delete :destroy, post_id: @comment.post_id, id: @comment.id, format: :json
    assert !Post::Comment.exists?(@comment)
    assert_response :success
  end
end