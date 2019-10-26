class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_form
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_before_shipping
  belongs_to_active_hash :size
  belongs_to :brand
  belongs_to :category
  belongs_to :buyer, class_name: "User", foreign_key: 'buyer_id'
  belongs_to :seller, class_name: "User", foreign_key: 'seller_id'
  belongs_to :shipping_address
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_form_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_before_shipping_id, presence: true
  validates :category_id, presence: true
  validates :name, presence: true
  validates :price, presence: true

end
