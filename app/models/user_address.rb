class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  # validates :postal_code, length: { is: 7 }, numericality: { only_integer: true }
  
end
