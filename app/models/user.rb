class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

has_one :credit_cards, dependent: :destroy
has_many :sns_credentials, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :destroy
has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
has_one :shipping_address, dependent: :destroy


validates :phone, presence: true, uniqueness: true


end
