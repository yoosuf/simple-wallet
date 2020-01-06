class Deposit < ApplicationRecord

  belongs_to :account

  validates :amount, presence: true
  validates :remarks, presence: true


  scope :total, -> (account_id) { where(account_id: account_id).sum(:amount) }

end
