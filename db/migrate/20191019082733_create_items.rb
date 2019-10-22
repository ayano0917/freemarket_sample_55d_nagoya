class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user,                              foreign_key: true      
      t.string     :name,                 null: false
      t.text       :description,          null: false
      t.references :condition,            null: false, foreign_key: true
      t.references :shipping_fee,         null: false, foreign_key: true #配送料金の負担
      t.references :shipping_form,        null: false, foreign_key: true #配送方法
      t.references :prefecture,           null: false, foreign_key: true #配送地域
      t.references :days_before_shipping, null: false, foreign_key: true #発送までの日数
      t.references :size,                              foreign_key: true
      t.references :brand,                             foreign_key: true
      t.references :category,             null: false, foreign_key: true
      t.references :price,                null: false 
      t.references :buyer,                             foreign_key: {to_table: :users}
      t.references :seller,                            foreign_key: {to_table: :users}
      t.string     :status,               null: false, default: "出品中"
      t.timestamps
    end
  end
end
