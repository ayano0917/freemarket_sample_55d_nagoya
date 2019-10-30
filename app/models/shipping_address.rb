class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :items
  belongs_to :user

  validates :shipping_last_name, presence: true
  validates :shipping_first_name, presence: true
  validates :shipping_last_name_kana, presence: true
  validates :shipping_first_name_kana, presence: true
  validates :prefecture, null: false
  validates :Postal_code, presence: true, length: { is: 8 }
  validates :city, presence: true
  validates :house_number, presence: true

end
