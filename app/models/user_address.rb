class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true

  # validates :postal_code, length: { is: 7 }, numericality: { only_integer: true }
  
end
