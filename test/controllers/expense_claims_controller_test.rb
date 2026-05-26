require "test_helper"

class ExpenseClaimsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expense_claims_index_url
    assert_response :success
  end

  test "should get show" do
    get expense_claims_show_url
    assert_response :success
  end

  test "should get new" do
    get expense_claims_new_url
    assert_response :success
  end

  test "should get create" do
    get expense_claims_create_url
    assert_response :success
  end

  test "should get edit" do
    get expense_claims_edit_url
    assert_response :success
  end

  test "should get update" do
    get expense_claims_update_url
    assert_response :success
  end

  test "should get destroy" do
    get expense_claims_destroy_url
    assert_response :success
  end
end
