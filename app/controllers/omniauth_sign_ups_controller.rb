class OmniauthSignUpsController < ApplicationController

  # 会員情報入力
  def omniauth_register
    @user = User.new
  end

  # 電話番号入力
  def omniauth_authentication
    session[:nickname] = omniauth_user_params[:nickname]
    session[:email] = omniauth_user_params[:email]
    session[:password] = omniauth_user_params[:password]
    session[:password_confirmation] = omniauth_user_params[:password_confirmation]
    session[:first_name] = omniauth_user_params[:first_name]
    session[:last_name] = omniauth_user_params[:last_name]
    session[:first_name_kana] = omniauth_user_params[:first_name_kana]
    session[:last_name_kana] = omniauth_user_params[:last_name_kana]
    session[:birth_year_id] = omniauth_user_params[:birth_year_id]
    session[:birth_month] = omniauth_user_params[:birth_month]
    session[:birth_day] = omniauth_user_params[:birth_day]
    session[:uid] = omniauth_user_params[:uid]
    session[:provider] = omniauth_user_params[:provider]
    @user = User.new
  end

  def create
      @user = User.create!(
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
        phone: omniauth_user_params[:phone]
      )
      SnsCredential.create!(
        uid: session[:uid],
        provider: session[:provider],
        user_id: @user.id
      )
      if @user.save
        sign_in(@user)
        redirect_to new_shipping_address_path
      else
        redirect_to omniauth_authentication_omniauth_sign_ups
      end

  end

  private

  def omniauth_user_params
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
      :uid,
      :provider
    )
  end

end
