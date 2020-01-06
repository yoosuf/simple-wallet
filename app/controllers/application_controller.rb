class ApplicationController < ActionController::API

  protected
  def current_account 
    account = Account.find_by(id: params[:account_id])

    if account.present?
      @account = account
    else
      render :json => {status: :ERROR,  messgae: "No Account Found"}
    end

  end
    
end
