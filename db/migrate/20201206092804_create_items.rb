class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name, null: false
      t.text :details, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :postage_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_date_id, null: false
      t.references :user, foreign_key: true
    end
  end
end
