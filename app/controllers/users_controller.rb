class UsersController < ApplicationController

  def update
    if current_user.update_attributes(profile: params[:user][:profile], nickname: params[:user][:nickname])
      redirect_to profile_user_mypage_path(current_user), notice: '変更しました。'
    else
      render profile_user_mypage_path(current_user), alert: '変更できませんでした。'
    end
  end

end
