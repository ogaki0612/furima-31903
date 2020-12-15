class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_1, null: false
      t.string :address_2, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end