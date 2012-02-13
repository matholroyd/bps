class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :bitcoin_address_id,                null: false
      t.integer :transaction_id,                    null: false
      t.decimal :amount,  precision: 16, scale: 8,  null: false

      t.timestamps
    end
  end
end
