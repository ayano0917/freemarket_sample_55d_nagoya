class SignUpsController < ApplicationController

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

  def new
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
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :phone,
      :image,
      :profile,
      :sales_amount,
      :points,
      :Postal_code,
      :city,
      :house_number,
      :building,
      )
  end
end
