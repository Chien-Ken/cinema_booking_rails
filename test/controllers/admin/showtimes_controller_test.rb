require "test_helper"

class Admin::ShowtimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_showtimes_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_showtimes_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_showtimes_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_showtimes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_showtimes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_showtimes_destroy_url
    assert_response :success
  end
end
