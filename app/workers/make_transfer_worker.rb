class MakeTransferWorker
  include Sidekiq::Worker

  def perform(recipient, remarks, amount)
    deposit  = Deposit.new(:account_id => recipient, :remarks => remarks, :amount => amount)
    deposit.save
  end
end
