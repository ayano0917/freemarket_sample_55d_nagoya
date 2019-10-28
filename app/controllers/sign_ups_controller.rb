class SignUpsController < ApplicationController

  def new
    # メアド・google・facebookでのログイン画面
  end

  def register
    @user = User.new
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
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year], 
      birth_month: session[:birth_month], 
      birth_day: session[:birth_day], 
      phone: user_params[:mobile_number]
    )
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
