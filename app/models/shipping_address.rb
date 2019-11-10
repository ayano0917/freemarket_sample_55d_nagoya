class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :items
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  # validates :shipping_last_name, presence: true
  # validates :shipping_first_name, presence: true
  # validates :shipping_last_name_kana, presence: true
  # validates :shipping_first_name_kana, presence: true
  # validates :prefecture, null: false
  # validates :postal_code, presence: true, length: { is: 8 }
  # validates :city, presence: true
  # validates :house_number, presence: true

end