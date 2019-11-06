class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(1) #商品出品未実装のため仮idで対応
    @user = User.find_by(id: @item.seller_id)
    @category = Category.find(@item.category_id).name
    @images = @item.images
    # ユーザーの他の商品
    @items = Item.where(seller_id: @user.id).where.not(id: @item.id).limit(6).order("id ASC")
    @prices = @items.map{|item| item.price} 
  end

  def new
  end

  def create
  end

  def confirm
  end
end