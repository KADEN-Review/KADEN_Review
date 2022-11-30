require "test_helper"

class Admin::HomeAppliancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_home_appliances_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_home_appliances_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_home_appliances_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_home_appliances_edit_url
    assert_response :success
  end
end
