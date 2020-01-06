class Api::V1::BalanceController < ApplicationController

  before_action :current_account

  def index
    diposits = Deposit.total(params[:account_id])
    transfers = Transfer.total(params[:account_id])
    balance = (diposits - transfers)
    render :json => {status: :OK,  data: { 
        total_deposits: diposits,
        total_transfers: transfers,
        total_balance: balance,
      }
    }
  end

end
