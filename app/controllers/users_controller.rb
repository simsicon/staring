class UsersController < ApplicationController
  def create
    user = User.create user_params
    if user.valid?
      sign_in(user)
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
