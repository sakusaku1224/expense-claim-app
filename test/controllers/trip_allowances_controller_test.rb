require "test_helper"

class TripAllowancesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get trip_allowances_create_url
    assert_response :success
  end

  test "should get update" do
    get trip_allowances_update_url
    assert_response :success
  end

  test "should get destroy" do
    get trip_allowances_destroy_url
    assert_response :success
  end
end
