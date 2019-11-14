class PurchasesController < ApplicationController
  before_action :set_item, only:[:buy, :new]
  before_action :set_card, only:[:buy, :new]

  def new
    @image = @item.images.first
    @shipping_addresses = current_user.shipping_address
    if @card.blank?
      #フラッシュメッセージを表示させる「カードが登録されていません。」
      redirect_to payment_user_mypage_path(current_user) #登録された情報がない場合にカード登録画面に移動
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand  
      case @card_brand
        when "Visa"
          @card_src = "visa.svg"
        when "JCB"
          @card_src = "jcb.svg"
        when "MasterCard"
          @card_src = "master-card.svg"
        when "American Express"
          @card_src = "american_express.svg"
        when "Diners Club"
          @card_src = "dinersclub.svg"
        when "Discover"
          @card_src = "discover.svg"
        end
    end
  end

  def buy
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if current_user.id != @item.seller_id
      charge = Payjp::Charge.create(
        amount:   @item.price,
        customer: @card.customer_id,
        currency: 'jpy',
      )
      @item.status = "売却済み"
      @item.buyer_id = current_user.id
      @item.save
      redirect_to user_mypage_path(current_user), notice: '購入が完了しました'
    else
      redirect_to item_purchase_path, alert: '購入に失敗しました。'
    end
  end

  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
