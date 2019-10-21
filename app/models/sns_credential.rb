class SnsCredential < ApplicationRecord
  belongs_to :user
  validates :uid, presnce: true, uniqueness: true
  validates :costomer_id, presnce: true
  validates :user_id, presnce: true, uniqueness: true
end
