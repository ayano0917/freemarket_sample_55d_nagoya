class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(current_user), notice: '変更しました。'
    else
      render action: "show"
    end

  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :profile
    )
  end

end
