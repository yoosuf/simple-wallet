class Api::V1::DepositsController < ApplicationController

  before_action :current_account

  def index
    @diposit = @account.deposits.order(created_at: :desc).all
    render json: {status: "OK", data: @diposit }
  end

  def create
    @diposit = @account.deposits.new(create_deposit_params)
    if @diposit.save
      render json: {status: "OK", data: @diposit }, status: :created
    else
      render json: {status: "Error", errors: @diposit.errors }, status: :unprocessable_entity
    end
  end

  private 
  def create_deposit_params
    params.permit(:amount, :remarks)
  end
    
end
