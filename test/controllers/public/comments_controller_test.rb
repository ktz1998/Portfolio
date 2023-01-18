require "test_helper"

class Public::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get _show" do
    get public_comments__show_url
    assert_response :success
  end
end
