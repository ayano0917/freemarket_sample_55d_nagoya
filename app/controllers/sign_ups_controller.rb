class SignUpsController < ApplicationController

  def new
  end

  def register
    # 会員情報入力
  end

  def authentication
    # 電話番号認証
  end

  def address
    # 住所入力
  end

  def pay
    # 支払い方法入力
    
  end

  def complete
    # 登録完了
  end

  def create
  end
  
  private

  def sign_ups_user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation,
      :phone,
      )
  end

  # メソッド名は適当です。
  def shipping_address_user_params
    params.require(:shipping).permit(
      :shipping_last_name,
      :shipping_first_name,
      :shipping_last_name_kana,
      :shipping_first_name_kana,
      :Postal_code,
      :prefecture,
      :city,
      :house_number,
      :building,
      :phone,
    )
  end
  
end
