require 'test_helper'

class Web::PostsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')
    @post = create 'post'
    @post2 = create 'post'
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get index json" do
    get :index, format: :json
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    post :create, post: { content: @post.content,
      title: @post.title, state_event: @post.state_event }
    assert_response :redirect
    assert_equal 'MyString2', @post.title
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    put :update, id: @post, post: { content: @post2.content,
      title: @post2.title, state_event: @post2.state_event }
    new_post = Post.find(@post.id)
    assert_response :redirect
    assert_equal 'MyString2', new_post.title
  end

  test "should destroy post" do
    delete :destroy, id: @post

    assert !Post.exists?(@post)
    assert_response :redirect
  end
end
