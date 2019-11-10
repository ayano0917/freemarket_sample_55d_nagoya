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
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new
    end
  end

  def confirm
    @item = Item.find(params[:id])
    card = CreditCard.find_by(user_id: current_user.id)
    if card.bank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to create_credit_card_user_mypage_path
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def purchase
    @item = Item.find(params[:id])
    card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id,
    currency: 'jpy',
    )
      @item.buyer_id = current_user.id
      item.status = "売却済み"
      if @item.save
        redirect_to #決済完了画面
      else
        redirect_to #商品詳細画面
      end
      
  end
  
  private
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
      # :category,
      :price,
      :shipping_address,
      :status,
      :buyer_id,
      images_attributes: [:image]
      # images_attributes: {images: []}
    ).merge(seller_id: current_user.id)
  end

end