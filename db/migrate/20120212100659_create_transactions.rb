class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.binary :binary,                       null: false
      t.string :bitcoin_tx_hash,  length: 64, null: false

      t.timestamps
    end
  end
end
