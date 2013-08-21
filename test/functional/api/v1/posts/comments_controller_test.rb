require 'test_helper'

class Api::V1::Posts::CommentsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials(configus.admin.login, configus.admin.pass)
    @comment = create 'post/comment'
  end

  test "should create comment" do
    assert @comment
    assert_response :success
  end

  test "should destroy comment" do
    delete :destroy, post_id: @comment.post_id, id: @comment.id
    assert !Post::Comment.exists?(@comment)
    assert_response :redirect
  end
end