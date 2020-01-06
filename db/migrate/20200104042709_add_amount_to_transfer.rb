class AddAmountToTransfer < ActiveRecord::Migration[6.0]
  def change
    add_column :transfers, :amount, :decimal, precision: 18, scale: 2
  end
end
