class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :items
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  validates :shipping_last_name,
  presence: {message: '入力してください'},
  length: {maximum: 35, message: '35文字以下で入力してください'}
  validates :shipping_first_name,
  presence: {message: '入力してください'},
  length: {maximum: 35, message: '35文字以下で入力してください'}
  validates :shipping_last_name_kana,
  presence: {message: '入力してください'},
  length: {maximum: 35, message: '35文字以下で入力してください'},
  format: {with: /\A([ァ-ン]|ー)+\z/, message: '全角カタカナ以外は使用出来ません。', allow_blank: true}
  validates :shipping_first_name_kana,
  presence: {message: '入力してください'},
  length: {maximum: 35, message: '35文字以下で入力してください'},
  format: {with: /\A([ァ-ン]|ー)+\z/, message: '全角カタカナ以外は使用出来ません。', allow_blank: true}
  validates :postal_code,
  presence: {message: '入力してください'},
  format: {with: /\A\d{3}[-]\d{4}\z/, message: 'フォーマットが不適切です'}
  validates :prefecture_id,
  presence: {message: '選択してください'}
  validates :city,
  presence: {message: '入力してください'},
  length: {maximum: 50, message: '50文字以下で入力してください'}
  validates :house_number,
  presence: {message: '入力してください'},
  length: {maximum: 100, message: '100文字以下で入力してください'}
  validates :building,
  length: {maximum: 100, message: '100文字以下で入力してください'}
  validates :phone,
  format: {with: /\A\d{10}$|^\d{11}\z/, message: '電話番号が正しくありません', allow_blank: true}

end