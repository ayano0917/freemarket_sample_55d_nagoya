class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.string  :postal_code
      t.integer :prefecture_id
      t.string  :city
      t.string  :house_number
      t.string  :building
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
