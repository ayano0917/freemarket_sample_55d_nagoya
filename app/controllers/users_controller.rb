class UsersController < ApplicationController

  def update
    @user = User.find(current_user)
    if @user.update_attributes(profile: params[:user][:profile], nickname: params[:user][:nickname])
      redirect_to profile_user_mypage_path(current_user)
    else
      render profile_user_mypage_path(current_user)
    end
  end

end
