require 'test_helper'

class Api::V1::TransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transfer = transfers(:one)
    @account = accounts(:account_one)
  end

  test "should get index" do
    get api_v1_account_transfers_url, as: :json
    assert_response :success
  end

  test "should create transfer" do
    assert_difference('Transfer.count') do
      post api_v1_account_transfers_url, params: { recipient_id: @transfer.recipient_id, amount: @transfer.amount, remarks: @transfer.remarks }, as: :json
    end

    assert_response 201
  end
end
