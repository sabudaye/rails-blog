require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials(configus.admin.login, configus.admin.pass)
    @comment = create 'post/comment'
  end

  test "should create comment" do
    post :create, post_id: @comment.post_id, post_comment: { body: @comment.body,
      commenter: @comment.commenter }
    assert_response :redirect
  end

  test "should destroy comment" do
    delete :destroy, post_id: @comment.post_id, id: @comment.id
    assert !Post::Comment.exists?(@comment)
    assert_response :redirect
  end
end