# README
## usersテーブル
|Column|Type|Options|
|————|——|————|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|email|string|null: false, unique: true|
|nickname|string|null: false|
|profile|text||
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|integer|null: false, unique:true|
|zipcode|integer|null: false|
|prefecture|integer|null: false|
|city|integer|null: false|
|building|integer|null: false|
### Association
has_one :credit_cards, dependent: :destroy
has_many :sns_credentials, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy
has_ many :buyers, class_name: ‘Item’, dependent: :destroy
has_ many :sellers, class_name: ‘Item’, dependent: :destroy

## credit_cardsテーブル
//PAY.JPの使用を想定
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
belongs_to :user

## sns_credentialsテーブル
|uid|string|null: false, unique: true|
|provider|string|null: false|
|token|text||
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user

## likesテーブル
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to :item
belongs_to :user

## commentsテーブル
|content|text|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :item
belongs_to :user

## itemsテーブル
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_from|integer|null: false|
|shipping_area|integer|null: false|
|days_before_shipping|integer|null: false|
|shipping_method|integer|null: false|
|trade_status|integer|null: false|
|size|string||   //数字をテキストとして扱う
|buyer_id|references|foreign_key:  { to_table: :users }|
|seller_id|references|null: false, foreign_key: { to_table: :users }| 
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
belongs_to :buyer_id, class_name: “User”
belongs_to :seller_id, class_name: “User”
belongs_to :brand
belongs_to :category
has_many :comments, dependent: :destroy
has_many :images, dependent: :destroy
has_many :likes, dependent: :destroy

## imagesテーブル
|content|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to :item

## brandsテーブル
|name|string|null: false, unique: true|
### Association
has_many :items

## categoriesテーブル
|name|string|null: false, unique: true|
|parent_id|references|null: false, foreign_key:true|
### Association
belongs_to :parent, class_name:”Category”
has_many :child, class_name:”Category”, foreign_key: “parent_id”, dependent: :destroy
has_many :items

## shipping_adressテーブル
|Postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|building|string|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to :item
belongs_to :user