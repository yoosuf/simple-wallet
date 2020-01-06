class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.references :account, foreign_key: true
      t.references :recipient, foreign_key: { to_table: 'accounts' }
      t.string :remarks
      t.timestamps
    end
  end
end
