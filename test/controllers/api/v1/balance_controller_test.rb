require 'test_helper'

class Api::V1::BalanceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:account_one)
  end


  test "should get index" do
    get api_v1_account_balance_index, as: :json
    assert_response :success
  end

end
