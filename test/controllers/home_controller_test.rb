require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select'title', 'My Notes'
    assert_select'h1', 'Contact Us'
    assert_select'p', 'Complete the following to get in contact with us'
  end

end
