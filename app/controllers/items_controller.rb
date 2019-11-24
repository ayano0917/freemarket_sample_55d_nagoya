class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy]
  before_action :set_card, only:[:purchase, :confirm]
  before_action :set_category, only:[:new, :create, :edit, :update]

  def index
  end

  def show
    @user = User.find(@item.seller_id)
    @categorys = Category.where(ancestry: nil)
    @category_parent = Category.find(@item.parent_id).name
    @category_child = Category.find(@item.child_id).name

    # ユーザーの他の商品
    @items = Item.where(seller_id: @user.id).where.not(id: @item.id).limit(6).order("id ASC")
    @images = @items.map{|item| item.images[0]}
    
    #孫カテゴリーその他の商品
    @otheritems = Item.where(category_id: @item.category.id).where.not(id: @item.id).where.not(id: @items.ids).limit(6).order("id ASC")
    @otherimages = @otheritems.map{|item| item.images[0]}

  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
    10.times{@item.images.build}
    @brand = Brand.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      Brand.transaction do
        if (brand_name = params[:item][:brand][:name]).present?
          # 既に保存されているブランドは追加で登録しない。
          unless (brand=Brand.find_by(name: brand_name)).present?
            brand = Brand.create!(name: brand_name)
          end
          @item.update!(brand_id: brand.id)
        end
      end
    else
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
    10.times{@item.images.build}
    @category = Category.where(ancestry: nil)
    @category_parent = Category.where(ancestry: @item.parent_id)
    @category_child = Category.where(ancestry: "#{@item.id}"+"/"+"#{@item.parent_id}")
    @sizes = Size.find(@item.size_id).siblings if @item.size_id.present?
    @brand = @item.brand.present? ? @item.brand : Brand.new
  end

  
  def update
    if @item.update(update_item_params)
      redirect_to item_path(@item)
    else
      redirect_to edit_item_path(@item)
    end

  end



  def destroy
    if @item.destroy
      redirect_to items_selling_user_mypage_path(current_user), notice: '商品を削除しました'
    else
      redirect_to items_selling_user_mypage_path(current_user), alert: '商品を削除できませんでした。'
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

  # 孫カテゴリーが選択された後に動くアクションAjax
  def get_size
    selected_category = Category.find(params[:category_id])
    if size_parent = selected_category.sizes[0]
      @sizes = size_parent.children
    elsif size_parent = selected_category.parent.sizes[0]
      @sizes = size_parent.children
    end
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
      :buyer_id,
      :status,
      :buyer_id,
      images_attributes: [:image]
    ).merge(seller_id: current_user.id)
  end

  def update_item_params
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
      :buyer_id,
      :status,
      :buyer_id,
      images_attributes: [:id, :image, :_destroy]
    ).merge(seller_id: current_user.id)
  end

end