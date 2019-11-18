class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true

  validates :postal_code,
  length: {is: 7},
  numericality: {only_integer: true, message: 'フォーマットが不適切です'}
  validates :city,
  length: {maximum: 50, message: '50文字以下で入力してください'}
  validates :house_number,
  length: {maximum: 100, message: '100文字以下で入力してください'}
  validates :building,
  length: {maximum: 100, message: '100文字以下で入力してください'}

end
