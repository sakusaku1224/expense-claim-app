require "test_helper"

class ExpenseItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get expense_items_create_url
    assert_response :success
  end

  test "should get update" do
    get expense_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get expense_items_destroy_url
    assert_response :success
  end
end
