require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should create post" do
  #   assert_difference('Post.count') do
  #     post :create, post: { content: "content", name: "name",
  #                           title: 'title', state: "public" }
  #   end

  #   assert_redirected_to post_path(assigns(:post))
  # end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  # test "should update post" do
  #   put :update, id: @post, post: { content: @post.content, name: @post.name,
  #                                   title: @post.title, state: @post.state }
  #   assert_redirected_to post_path(assigns(:post))
  # end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
