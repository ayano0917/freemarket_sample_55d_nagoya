class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user,                              foreign_key: true      
      t.string     :name,                 null: false
      t.text       :description,          null: false
      t.integer    :condition,            null: false
      t.integer    :shipping_fee,         null: false #配送料金の負担
      t.integer    :shipping_form,        null: false #配送方法
      t.integer    :prefecture,           null: false #配送地域
      t.integer    :days_before_shipping, null: false #発送までの日数
      t.integer    :size
      t.string     :brand
      t.references :category,             null: false, foreign_key: true
      t.integer    :price,                null: false 
      t.references :buyer,                             foreign_key: {to_table: :users}
      t.references :seller,                            foreign_key: {to_table: :users}
      t.string     :status,               null: false, default: "出品中"
      t.timestamps
    end
  end
end