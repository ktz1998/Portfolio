require "test_helper"

class Public::ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_item_new_url
    assert_response :success
  end

  test "should get show" do
    get public_item_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_item_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_item_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_item_destroy_url
    assert_response :success
  end
end
