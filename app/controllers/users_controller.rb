class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show
  end

  def update

    if @user.update(user_params)
      redirect_to user_path(current_user), notice: '変更しました。'
    else
      render action: "show"
    end

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :profile
    )
  end

end
