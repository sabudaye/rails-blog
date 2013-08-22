require 'test_helper'

class Api::V1::PostsControllerTest < ActionController::TestCase
  setup do
    #TODO move it on helper
    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials(configus.admin.login, configus.admin.pass)

    @post = create 'post'
    @post2 = create 'post'
  end

  test "should get index json" do
    get :index, format: :json
    assert_response :success
  end

  test "should show json" do
    get :show, id: @post.id, format: :json
    assert_response :success
  end

  test "should create post" do
    post :create, post: { content: @post.content,
      title: @post.title, state_event: @post.state_event }, format: :json
      assert_response :success
  end

  test "should update post" do
    put :update, id: @post, post: { content: @post2.content,
      title: @post2.title, state_event: @post2.state_event }, format: :json
    assert_response :success
  end

  test "should destroy post" do
    delete :destroy, id: @post, format: :json

    assert !Post.exists?(@post)
    assert_response :success
  end
end