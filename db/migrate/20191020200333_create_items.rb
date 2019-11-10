class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string     :name,                 null: false
      t.text       :description,          null: false
      t.integer    :condition_id            #null: false
      t.integer    :shipping_fee_id         #null: false #配送料金の負担
      t.integer    :shipping_form_id        #null: false #配送方法
      t.integer    :prefecture_id           #null: false #配送地域
      t.integer    :days_before_shipping_id #null: false #発送までの日数
      t.integer    :size_id
      t.string     :brand
      t.string     :category             #null: false
      t.integer    :price                #null: false 
      t.references :seller,                            foreign_key: {to_table: :users}
      # t.references :buyer,                             foreign_key: {to_table: :users}
      t.string     :status               #null: false, default: ""
      t.timestamps
    end
  end
end