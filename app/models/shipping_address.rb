class ShippingAddress < ApplicationRecord
  has_many :items
  belongs_to :user

  validates :shipping_last_name, presence: true
  validates :shipping_first_name, presence: true
  validates :shipping_last_name_kana, presence: true
  validates :shipping_first_name_kana, presence: true
  #郵便番号は***-****の8桁にて制限。文字タイプの制限が必要であれば追記お願いします。
  validates :Postal_code, presence: true, length: { is: 8 }
  validates :city, presence: true
  validates :house_number, presence: true



end
