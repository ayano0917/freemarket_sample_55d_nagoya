class UsersController < ApplicationController

  def update
    @user = User.find(current_user)
    if @user.update(params[:user][:profile])
      redirect_to root
    else
      render root(current_user)
    end
  end

end
