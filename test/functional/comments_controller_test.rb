require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_AUTHORIZATION'] = 
        ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')
    @post = posts(:one)
    post :create, post_id: @post.id,
      comment: { body: '1111', commenter: '222' }
    @comment = @post.comments.find_by_body('1111')
  end

  test "should create comment" do
    assert @comment
    assert_response :redirect
  end

  test "should destroy comment" do
    delete :destroy, post_id: @post.id, id: @comment.id
    assert !Comment.exists?(@comment)
  end
end
