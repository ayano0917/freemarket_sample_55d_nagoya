class UserAddressesController < ApplicationController

  def show
    if current_user.user_address.present?
      @user_address = UserAddress.find_by(user_id: current_user.id)
    else
      @user_address = UserAddress.new
    end
  end

  def update
    @user_address = UserAddress.find_or_initialize_by(user_id: current_user.id)

    if @user_address.update(user_address_params)
      redirect_to user_address_path(current_user), notice: '変更しました。'
    else
      render action: "show"
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
