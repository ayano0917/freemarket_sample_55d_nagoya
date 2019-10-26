# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone|string|null: false, unique:true|
|image|string|
|profile|text|
|sales_amount|integer|
|points|integer|
|Postal_code|string
|prefecture|string
|city|string
|house_number|string
|building|string|
# devise機能にてデフォルト
|email|string|null: false, unique: true| 

### Association
has_one :credit_cards, dependent: :destroy
has_many :sns_credentials, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy
has_ many :buyers, class_name: ‘Item’, dependent: :destroy
has_ many :sellers, class_name: ‘Item’, dependent: :destroy
has_one :shipping_address, dependent: :destroy

## credit_cardsテーブル
//PAY.JPの使用を想定
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
belongs_to :user

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false, unique: true|
|provider|string|null: false|
|token|text||
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to :item
belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :item
belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition_id|references|null: false|
|shipping_fee_id|references|null: false| 
|shipping_form_id|references|null: false|
|prefecture_id|references|null: false| 
|days_before_shipping_id|references|null: false|
|size_id|references|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|buyer_id|references|foreign_key:  { to_table: :users }|
|seller_id|references|null: false, foreign_key: { to_table: :users }| 
|status|string|null:false|

### Association
belongs_to :buyer_id, class_name: “User”
belongs_to :seller_id, class_name: “User”
belongs_to :brand
belongs_to :user
belongs_to :category
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :images, dependent: :destroy


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to :item

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