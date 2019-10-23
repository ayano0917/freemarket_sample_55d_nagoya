class Brand < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, presnce: true, uniqueness: true
end
