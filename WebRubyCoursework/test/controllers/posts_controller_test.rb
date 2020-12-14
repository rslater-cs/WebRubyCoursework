require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url, params: { post: {user_id: @user.id}}
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: {user_id: @user.id, content: "test message", dateposted: "2020-05-12"}}
    end

    assert_redirected_to posts_path
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end

  test "should not create valid post" do
    post = Post.new

    post.save

    refute post.valid?
  end

  test "should create valid post" do
    post = Post.new

    post.user = @user
    post.dateposted = "2020-05-10"
    post.content = "test"

    post.save

    assert post.valid?
  end
end
