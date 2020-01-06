class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.references :account, foreign_key: true
      t.string :remarks
      t.timestamps
    end
  end
end
