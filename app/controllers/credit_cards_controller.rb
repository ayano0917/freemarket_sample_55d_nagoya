class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def new #sign-upのクレジットカード登録の画面
    @credit_card = CreditCard.new
    # redirect_to action: "new" if @credit_card.present?
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

    if params['payjp-token'].blank?
      redirect_to action: "new" #id: current_user.id
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      ) 
      @credit_card = CreditCard.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card,
      )
      if @credit_card.save
        redirect_to complete_sign_ups_path
      else
        redirect_to credit_cards_path #id:current_user.id
      end
    end
  end

  def destroy
    card = current_user.credit_cards.first
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "confirmation", id: currrent_user.id
  end

  def show #マイページでクレジットカード情報入力完了後の画面
    card = current_user.credit_cards.first
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to action: "confirmation", id: current_user.id
    end
  end

  def edit #マイページクレジットカード情報入力画面
  end

  def confirmation #マイページのクレジットカードを追加する画面
    card = current_user.credit_cards
    redirect_to action: "show" if card.exists?
  end

  
  private

  def set_card
    # @credit_card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    # もし存在していたらという記述
  end
end
