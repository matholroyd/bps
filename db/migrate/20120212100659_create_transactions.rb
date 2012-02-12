class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :raw_in_hex, null: false

      t.timestamps
    end
  end
end
