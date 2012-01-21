class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name,            length: 255,  null: false

      t.timestamps
    end
  end
end
