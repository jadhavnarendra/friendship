require "test_helper"

class FriendControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get friend_create_url
    assert_response :success
  end
end
