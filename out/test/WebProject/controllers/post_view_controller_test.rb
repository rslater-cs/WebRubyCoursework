require 'test_helper'

class PostViewControllerTest < ActionDispatch::IntegrationTest
  test "should get postview" do
    get post_view_postview_url
    assert_response :success
  end

end
