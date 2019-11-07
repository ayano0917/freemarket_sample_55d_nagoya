class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(1) #商品出品未実装のため仮idで対応
    @user = User.find(@item.seller_id)
    @category = Category.find(@item.category_id).name

    # ユーザーの他の商品
    @items = Item.where(seller_id: @user.id).where.not(id: @item.id).limit(6).order("id ASC")
    @images = @items.map{|item| item.images[0]} 
  end

  def new
  end

  def create
  end

  def confirm
  end
end