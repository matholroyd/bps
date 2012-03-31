class CreateAddressExternal < ActiveRecord::Migration
  def change
    create_table :address_externals do |t|
      t.string  :address,       length: 34,   null: false
      t.boolean :forwardable,                 null: false,  default: false

      t.timestamps
    end
  end
end
