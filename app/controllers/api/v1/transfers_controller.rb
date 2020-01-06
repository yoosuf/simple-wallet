class Api::V1::TransfersController < ApplicationController

  before_action :current_account

  def index
    @transfers = @account.transfers.order(created_at: :desc).all
    render json: {status: "OK", data: @transfers }
  end


  def create
    @transfer = @account.transfers.new(create_transfer_params)

    if @transfer.save
      MakeTransferWorker.perform_async(@transfer.recipient_id, "Transferd by #{@transfer.account.id}", @transfer.amount)
      render json: {status: "OK", data: @transfer }, status: :created
    else
      render json: {status: "Error", errors: @transfer.errors }, status: :unprocessable_entity
    end
  end

  private 
  def create_transfer_params
    params.permit(:amount, :remarks, :recipient_id)
  end

end
