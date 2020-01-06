class AddAmountToDeposit < ActiveRecord::Migration[6.0]
  def change
    add_column :deposits, :amount, :decimal, precision: 18, scale: 2
  end
end
