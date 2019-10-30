class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  # このindexアクションは仮で設置している
  def index
  end

  def new
    @credit_card = CreditCard.new
    # redirect_to action: "new" if @credit_card.present?
  end

  def create
    Payjp.api_key = 'sk_test_9f89757cd9ede6f6678621dc'
    
    if params['payjp-token'].blank?
      # もじトークンが空白であればtrueを返す
      render action: "new"
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
        render credit_cards_path
      end
    end
  end

  def show
  end
  
  def destroy
  end


  private

  def set_card
    # @credit_card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    # もし存在していたらという記述
  end
end
