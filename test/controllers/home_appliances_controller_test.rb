require "test_helper"

class HomeAppliancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_appliances_index_url
    assert_response :success
  end

  test "should get show" do
    get home_appliances_show_url
    assert_response :success
  end

  test "should get edit" do
    get home_appliances_edit_url
    assert_response :success
  end

  test "should get new" do
    get home_appliances_new_url
    assert_response :success
  end
end
