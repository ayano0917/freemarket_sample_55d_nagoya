class ShippingAddressesController < ApplicationController

  def new
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)

    if @shipping_address.save
      redirect_to new_credit_card_path
    else
      render new_shipping_address_path
    end

  end

  def show
  end

  def update
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
    )
  end

end
