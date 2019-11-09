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
    @item = Item.new
    # @image = Image.new
    @item.images.build
    # @item.build_image
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path 
    # end
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
      # :category,
      :price,
      :buyer_id,
      :seller_id,
      :shipping_address, 
      :status,
      # :image,
      images_attributes: [:image]
      # images_attributes: {images: []}
      # image_attributes:[:image]
      # image:[]
    )
  end
end