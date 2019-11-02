class MypagesController < ApplicationController

  def show
  end

  def profile
  end

  def logout
  end

  def personal_info
  end

  # ここからクレジットカード関連
  def payment  #クレジットカード追加画面
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "credit_card_show" if card.exists?
  end

  def credit_card_reg  #クレジットカード入力画面
    
  end

  def credit_card_show  #クレジットカード登録カード表示
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "create_credit_card" 
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
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "credit_card_show"  #クレジットカード
      else
        redirect_to action: "credit_card_reg"   #クレジットカード入力画面に戻る
      end
    end
  end
  # ここまで

  def listing_product
  end

  def shipping_address
  end

  def during_trade
  end

  def sold
  end

  def bought_product
  end

  def past_trade
  end

end
