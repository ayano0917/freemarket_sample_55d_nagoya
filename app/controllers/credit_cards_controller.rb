class CreditCardsController < ApplicationController
  require "payjp"


  def new
      @credit_card = CreditCard.new
    # redirect_to action: "new" if @credit_card.present?
    # FIXME 同じページをリダイレクトするので修正が必要
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(
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
        redirect_to root_path
     end
    end
  end

  def delete
    card = CreditCard.find_by(user_id: current_user.id)
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to payment_user_mypage_path(current_user)
  end

end
