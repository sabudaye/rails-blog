require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_AUTHORIZATION'] =
        ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')
    @comment = create 'post/comment'
  end

  test "should create comment" do
    assert @comment
    assert_response :success
  end

  test "should destroy comment" do
    delete :destroy, post_id: @comment.post_id, id: @comment.id
    assert !Post::Comment.exists?(@comment)
  end
end