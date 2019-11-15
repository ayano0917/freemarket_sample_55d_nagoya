class ItemsController < ApplicationController
  before_action :set_item, only:[:purchase]
  before_action :set_category, only:[:new, :create, :edit, :update]

  def index
  end

  def show
    @item = Item.find(1) #商品出品未実装のため仮idで対応
    @user = User.find(@item.seller_id)
    @categorys = Category.where(ancestry: nil)
    @category_parent = Category.find(@item.parent_id).name
    @category_child = Category.find(@item.child_id).name

    # ユーザーの他の商品
    @items = Item.where(seller_id: @user.id).where.not(id: @item.id).limit(6).order("id ASC")
    @images = @items.map{|item| item.images[0]} 
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path , notice: '商品が出品できました。'
    else
      redirect_to new_item_path, alert: '出品に失敗しました。'
    end
  end

  # 親カテゴリーが選択された後に動くアクションAjax
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクションAjax
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @category_parents = Category.where(ancestry: nil)
  end


  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :condition_id,
      :shipping_fee_id,
      :shipping_form_id,
      :prefecture_id,
      :days_before_shipping_id, 
      :size_id,
      :brand,
      :category_id,
      :parent_id,
      :child_id,
      :price,
      :shipping_address,
      :status,
      :buyer_id,
      images_attributes: [:image]
      # images_attributes: {images: []}
    ).merge(seller_id: current_user.id)
  end

end