class CreditCardsController < ApplicationController

  # このindexアクションは仮で設置している
  def index
  end

  def new
    @credit_card = CreditCard.new
  end

  def create
  end

  def show
  end
  
  def destroy
  end

end
