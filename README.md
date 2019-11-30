# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year_id|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone|string|null: false|
|image|string|
|profile|string|
|sales_amount|integer|
|points|integer|
|Postal_code|string|
|prefecture|string|
|city|string|
|house_number|string|
|building|string|
# devise機能にてデフォルト
|email|string|null: false, unique: true|

### Association
has_many :sns_credentials, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :destroy
has_one :user_address, dependent: :destroy
has_one :credit_cards, dependent: :destroy
has_one :shipping_address, dependent: :destroy

## credit_cardsテーブル
//PAY.JPの使用を想定
|Column|Type|Options|
|------|----|-------|
|user|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
belongs_to :user

<!-- ## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false, unique: true|
|provider|string|null: false|
|token|text||
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user -->

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
belongs_to :item
belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition_id|integer|null: false|
|shipping_fee_id|integer|null: false| 
|shipping_form_id|integer|null: false|
|prefecture_id|integer|null: false| 
|days_before_shipping_id|integer|null: false|
|size_id|integer|
|brand|string|
|category_id|integer|foreign_key: true, index: true|
|price|integer|null: false|
|buyer_id|references|foreign_key:  { to_table: :users }|
|seller_id|references|null: false, foreign_key: { to_table: :users }| 
|status|string|null:false, default: ""|
|parent_id|integer|null: false, index: true|
|child_id|integer|null: false, index: true|


### Association
belongs_to_active_hash :condition
belongs_to_active_hash :shipping_fee
belongs_to_active_hash :shipping_form
belongs_to_active_hash :prefecture
belongs_to_active_hash :days_before_shipping
belongs_to :brand, optional: true
belongs_to :size, optional: true
belongs_to :category, optional: true
belongs_to :seller, class_name: "User", foreign_key: 'seller_id'
belongs_to :buyer, class_name: "User", foreign_key: 'buyer_id', optional: true
has_many :comments, dependent: :destroy
has_many :images, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to :item, optional: true

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
### Association
has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|parent_id|references|null: false, foreign_key:true|
### Association
belongs_to :parent, class_name:”Category”
has_many :child, class_name:”Category”, foreign_key: “parent_id”, dependent: :destroy
has_many :items

## shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_last_name|string|null: false|
|shipping_first_name|string|null: false|
|shipping_last_name_kana|string|null: false|
|shipping_first_name_kana|string|null: false|
|Postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string|
|phone|string|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
has_many :items
belongs_to :user