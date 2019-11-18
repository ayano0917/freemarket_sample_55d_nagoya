class UserAddressesController < ApplicationController

  def update
    @user_address = UserAddress.find_or_initialize_by(user_id: current_user.id)

    if @user_address.update(
      postal_code: user_address_params[:postal_code],
      prefecture_id: user_address_params[:prefecture_id],
      city: user_address_params[:city],
      house_number: user_address_params[:house_number],
      building: user_address_params[:building]
      )
      redirect_to personal_info_user_mypage_path(current_user), notice: '変更しました。'
    else
      render_to user_mypage_path(current_user), alert: '変更出来ませんでした。'
    end
      
  end

  private
  def user_address_params
    params.require(:user_address).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :house_number,
      :building
    )
  end
  
end
