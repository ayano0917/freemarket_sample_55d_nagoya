class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(1)
    @user = User.find_by(id: @item.user_id)
    @category = Category.find(@item.category_id).name
    @images = @item.images 
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
        :user_id,
        :name, 
        :description, 
        :condition_id, 
        :shipping_fee_id,
        :shipping_form_id,
        :prefecture_id, 
        :days_before_shipping_id,
        :size_id,
        :brand,
        :buyer_id,
        :seller_id,
        :category,
        :price,
        :shipping_address,
        :status,

      )
  end
end