require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: "test@email", password: "testpassword" } }
    end

    assert_redirected_to posts_path
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should not create valid user" do
    user = User.new

    user.save

    refute user.valid?
  end

  test "should create valid user" do
    user = User.new

    user.email = "test"
    user.password = "test"

    user.save

    assert user.valid?
  end
end
