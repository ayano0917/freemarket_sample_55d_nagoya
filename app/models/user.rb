class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  def self.from_omniauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    if user
      return user
    else
      @user = User.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
  end

has_many :sns_credentials, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :destroy
has_one :user_address, dependent: :destroy
has_one :credit_cards, dependent: :destroy
has_one :shipping_address, dependent: :destroy
belongs_to_active_hash :birth_year

validates :nickname,
presence: {message: 'ニックネームを入力してください'},
length: {maximum: 20, message: '20文字以下で入力してください'}
validates :email,
presence: {message: 'メールアドレスを入力してください'},
uniqueness: {message: 'そのメールアドレスは既に使われております'},
format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'フォーマットが不適切です'}
validates :password,
presence: {message: 'パスワードを入力してください'},
length: {in: 7..128, message: 'パスワードは7文字以上128文字以下で入力してください'},
format: { with: /\A[a-z0-9]+\z/i, message: '英字と数字両方を含むパスワードを設定してください'},
on: :create
validates :last_name,
presence: {message: '姓を入力してください'},
length: { maximum: 35, message: '姓は35文字までです', allow_blank: true},
format: {with: /\A[一-龥ぁ-ん]+\z/, message: '姓に数字や特殊文字は使用できません', allow_blank: true}
validates :first_name,
presence: {message: '名を入力してください'},
length: { maximum: 35, message: '名は35文字までです', allow_blank: true},
format: {with: /\A[一-龥ぁ-ん]+\z/, message: '名に数字や特殊文字は使用できません', allow_blank: true}
validates :last_name_kana,
presence: {message: '姓カナを入力してください'},
length: {maximum: 35, message: '姓カナは35文字までです', allow_blank: true},
format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: '姓カナに数字や特殊文字は使用できません', allow_blank: true}
validates :first_name_kana,
presence: {message: '名カナを入力してください'},
length: { maximum: 35, message: '名カナは35文字までです', allow_blank: true},
format: {with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: '名カナに数字や特殊文字は使用できません', allow_blank: true}
validates :birth_year_id, :birth_month, :birth_day,
presence: {message: '生年月日を正しく入力してください'}
validates :phone,
presence: { message: '会員登録できません' },
uniqueness: {message: 'その番号は既に使われております'},
format: {with: /\A\d{10}$|^\d{11}\z/, message: '電話番号の書式を確認してください', allow_blank: true}

validates :profile, length: { maximum: 1000 }

end
