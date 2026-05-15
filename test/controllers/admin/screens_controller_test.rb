require "test_helper"

class Admin::ScreensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_screens_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_screens_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_screens_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_screens_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_screens_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_screens_destroy_url
    assert_response :success
  end
end
