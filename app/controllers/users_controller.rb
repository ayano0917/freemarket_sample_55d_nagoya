class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end

  def update
  end

  def edit
    @user = User.find(params[:id])
  end

  def identification
    # @user_address = UserAddress.find_by(user_id: current_user.id)
  end

  def logout
  end

  def complete
  end

  def show_creaditcard
    #マイページー設定ー支払い方法ー新規作成
  end

  def new_creaditcard
    #クレカの登録がない時に、カードの詳細を入力する画面
  end
  
end
