class CreateShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :shipping_last_name, null: false
      t.string  :shipping_first_name, null: false
      t.string  :shipping_last_name_kana, null: false
      t.string  :shipping_first_name_kana, null: false
      t.string  :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string  :city, null: false
      t.string  :house_number, null: false
      t.string  :building
      t.string  :phone
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end