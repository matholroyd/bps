class CreateBitcoinAddresses < ActiveRecord::Migration
  def change
    create_table :bitcoin_addresses do |t|
      t.string  :address,       length: 34,   null: false
      t.string  :private_key,   length: 64,   null: false
      t.string  :public_key,    length: 130,  null: false

      t.text    :description,                 null: false

      t.timestamps
    end
  end
end
