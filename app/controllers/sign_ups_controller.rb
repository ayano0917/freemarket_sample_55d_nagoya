class SignUpsController < ApplicationController

  def new
    # メアド・google・facebookでのログイン画面
  end

  def register
    # 会員情報入力
    @user = User.new
  end

  def authentication
    # 電話番号入力
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:first_name] = user_params[:first_name]
    session[:last_name] = user_params[:last_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:birth_year_id] = user_params[:birth_year_id]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new
  end

  def shipping_address
    # 配送先住所登録
    @shipping_address = ShippingAddress.new
  end

  def pay
    # 支払い方法入力
    @credit_card = CreditCard.new
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
      birth_year_id: session[:birth_year_id], 
      birth_month: session[:birth_month], 
      birth_day: session[:birth_day], 
      phone: user_params[:phone]
    )
    if @user.save
      redirect_to shipping_address_sign_ups_path
    else
      render authentication_sign_ups_path
    end
    # 上記が会員情報・電話番号データ
    @shipping_address = ShippingAddress.new(
      shipping_last_name: shipping_address_params[:shipping_last_name],
      shipping_first_name: shipping_address_params[:shipping_first_name],
      shipping_last_name_kana: shipping_address_params[:shipping_last_name_kana],
      shipping_first_name_kana: shipping_address_params[:shipping_first_name_kana],
      postal_code: shipping_address_params[:postal_code],
      prefecture: shipping_address_params[:prefecture],
      city: shipping_address_params[:city],
      house_number: shipping_address_params[:house_number],
      building: shipping_address_params[:building],
      phone: shipping_address_params[:phone],
    )
    if @shipping_address.save
      redirect_to pay_sign_ups_path
    else
      render shipping_address_sign_ups_path
    end

  end
  
  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :last_name, 
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birth_year_id,
      :birth_month,
      :birth_day,
      :phone,
      :image,
      :profile,
      :sales_amount,
      :points
    ) 
  end

  def shipping_address_params
    params.require(:shipping_address).permit(
      :shipping_last_name,
      :shipping_first_name,
      :shipping_last_name_kana,
      :shipping_first_name_kana,
      :postal_code,
      :prefecture,
      :city,
      :house_number,
      :building,
      :phone
    )
  end
end
