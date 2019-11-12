class SignUpsController < ApplicationController

  # メアド・google・facebookでのログイン画面
  def new
  end
  
  # 会員情報入力
  def register
    @user = User.new
  end

  # 電話番号入力
  def authentication
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

  # 支払い方法入力
  def pay
    @credit_card = CreditCard.new
  end

  # 登録完了
  def complete
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
      sign_in(@user)
      redirect_to new_shipping_address_path
    else
      render authentication_sign_ups_path, notice: "入力に誤りがあります。"
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

end
