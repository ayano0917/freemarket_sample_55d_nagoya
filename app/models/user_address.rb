class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  #郵便番号は***-****の8桁にて制限。文字タイプの制限が必要であれば追記お願いします。
  # ハイフン抜き・数字のみ
  validates :Postal_code, length: { is: 7 }, numericality: { only_integer: true }
  

end
