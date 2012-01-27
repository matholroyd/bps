class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :bitcoin_address,  length: 34,   null: false

      t.string :email,            length: 150
      t.string :name,             length: 100
      t.text   :description

      t.timestamps
    end
  end
end
