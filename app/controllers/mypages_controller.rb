class MypagesController < ApplicationController

  def show
    @items = current_user.seller_items
  end

  def profile
    @user = User.new
  end

  def logout
  end

  def payment  #クレジットカード追加画面
    card = CreditCard.find_by(user_id: current_user.id)
    redirect_to action: "credit_card_show" if card.present?
  end

  def credit_card_reg  #クレジットカード入力画面
  end

  def credit_card_show  #クレジットカード登録カード表示
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "payment" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
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

  def create_credit_card #クレジットカード顧客情報作成
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token_mypage'].blank?
      redirect_to action: "payment"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token_mypage'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to credit_card_show_user_mypage_path, notice: 'クレジットカードが登録できました。' #クレジットカード確認画面
      else
        redirect_to payment_user_mypage_path, alert: 'クレジットカードの登録に失敗しました。'  #クレジットカード追加画面に戻る
      end
    end
  end

  def items_selling
    @items = current_user.seller_items.where(buyer_id: nil).order('id DESC').limit(13)
  end

  def items_during_trading
  end

  def items_sold
    @items = current_user.seller_items.where.not(buyer_id: nil).order('id DESC').limit(13)
  end

  def bought_during_trading
  end

  def bought_past_trade
    @items = current_user.buyer_items.where.not(buyer_id: nil).order('id DESC').limit(13)
  end

  def notice
  end

  def todo_list
  end

  def like_list
  end

  def update_email_pass
  end

  def confirm_phone
  end

end