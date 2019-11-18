class ShippingAddressesController < ApplicationController

  def new
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)

    if @shipping_address.save
      redirect_to new_credit_card_path
    else
      render new_shipping_address_path, notice: "入力に誤りがあります。"
    end

  end

  def show
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])

    if @shipping_address.update(shipping_address_params)
      redirect_to change_shipping_address_user_mypage_path(current_user), notice: '変更しました。'
    else
      render change_shipping_address_user_mypage_path(current_user), alert: '変更出来ませんでした。'
    end
  end

  def destroy
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(
      :shipping_last_name,
      :shipping_first_name,
      :shipping_last_name_kana,
      :shipping_first_name_kana,
      :postal_code,
      :prefecture_id,
      :city,
      :house_number,
      :building,
      :phone
    ).merge(user_id: current_user.id)
  end

end
