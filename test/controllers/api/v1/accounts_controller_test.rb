require 'test_helper'

class Api::V1::AccountsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @account = accounts(:account_one)
  end



  test "should get index" do
    get api_v1_accounts_url, as: :json
    assert_response :success
  end



  test "should create account" do
    assert_difference('Account.count') do
      post api_v1_accounts_url, params: { name: @account.name  }, as: :json
    end
    assert_response 201
  end


end


