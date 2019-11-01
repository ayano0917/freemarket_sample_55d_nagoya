class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(id: params[:id])
    @user = User.find(@item.seller_id)
    @category = Category.find(@item.category_id).name
    @brand = @item.brand
    @description = @item.description
    @condition = @item.condition
    @shipping_fee = @item.shipping_fee
    @shipping_form = @item.shipping_form
    @prefecture = @item.prefecture
    @days_before_shipping = @item.days_before_shipping
    @size = @item.size
    @price = @item.price

    # ユーザーの他の商品
    @items = Item.where.not(id: @item.id).limit(6).order("id ASC")
    @prices = @items.map{|item| item.price}    
  end

  def new
  end

  def create
  end

  def confirm
  end
  
  private
  def item_params
    params.require(:item).permit(
        :name, 
        :description, 
        :condition, 
        :shipping_fee,
        :shipping_form,
        :prefecture, 
        :days_before_shipping,
        :size,
        :brand,
        :category_id,
        :price,
        :shipping_address_id,
        :status
      ).merge(seller_id: current_user.id)
  end
end