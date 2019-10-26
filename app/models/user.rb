class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          telephone: "08000000000"
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end

has_one :credit_cards, dependent: :destroy
has_many :sns_credentials, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :destroy
has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
has_one :shipping_address, dependent: :destroy


validates :nickname, presence: true
validates :email, presence: true, uniqueness: true
validates :last_name, presence: true
validates :first_name, presence: true
validates :last_name_kana, presence: true
validates :first_name_kana, presence: true
validates :birth_year, presence: true
validates :birth_month, presence: true
validates :birth_day, presence: true
validates :phone, presence: true, uniqueness: true

end
