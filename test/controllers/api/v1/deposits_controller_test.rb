require 'test_helper'

class Api::V1::DepositsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deposit = deposits(:one)
    @account = accounts(:account_one)
  end

  test "should get index" do
    get api_v1_account_deposits_url, as: :json
    assert_response :success
  end

  test "should create deposit" do
    assert_difference('Deposit.count') do
      post api_v1_account_deposits_url, params: { amount: @deposit.amount, remarks: @deposit.remarks  }, as: :json
    end

    assert_response 201
  end
end
