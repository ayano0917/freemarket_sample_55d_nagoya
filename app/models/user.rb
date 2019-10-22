class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

has_one :credit_cards, dependent: :destroy
has_many :sns_credentials, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy
has_ many :buyers, class_name: ‘Item’, dependent: :destroy
has_ many :sellers, class_name: ‘Item’, dependent: :destroy
has_one :shipping_address, dependent: :destroy


validates :phone, presence: true, unique: true


end
