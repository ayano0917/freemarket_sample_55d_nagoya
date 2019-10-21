class CreditCard < ApplicationRecord
  belongs_to :user
  validates :costomer_id, presnce: true
  validates :card_id, presnce: true
  validates :user_id, presnce: true
end
