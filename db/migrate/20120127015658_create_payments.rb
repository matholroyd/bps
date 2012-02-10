class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :bitcoin_address_id,        null: false

      t.string :email,    length: 150
      t.string :payer,    length: 100
      t.text   :description

      t.timestamps
    end
  end
end
