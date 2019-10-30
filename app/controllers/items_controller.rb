class ItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item.new(item_params)
    if @item.valid?
      render :new
    else @item.save
      render :done
    end
  end

  def confirm
  end
  
  private
  def item_params
    params.require(:item).permit(
      :user_id,
      :name,
      :description,
      :condition,
      :shipping_fee,
      :shipping_form,
      :prefecture,
      :days_before_shipping, 
      :size,
      :brand,
      :category,
      :price,
      :buyer,
      :seller,
      :shipping_address, 
      :status,
    )
  end
end