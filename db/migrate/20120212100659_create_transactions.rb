class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.binary :binary, null: false

      t.timestamps
    end
  end
end
