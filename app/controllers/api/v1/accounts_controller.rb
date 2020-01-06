class Api::V1::AccountsController < ApplicationController

  # All Accounts
  # get api/v1/accounts
  def index
    accounts = Account.all.reverse
    render :json => accounts
  end

  # Create Account
  # post api/v1/accounts
  def create
    @account = Account.new(create_account_params)
    if @account.save
      render json: {status: "OK", data: @account } , status: :created
    else
      render json: {status: "Error", errors: @account.errors} , status: :unprocessable_entity
    end
  end

  private 
  def create_account_params
    params.permit(:name)
  end
end
