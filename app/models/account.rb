class Account < ApplicationRecord

  has_many :deposits
  has_many :transfers

  
  validates :name, presence: true


end
