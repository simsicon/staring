class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

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

  def stay
    @user = User.find_by_id(params[:id])
    @user.stay

    render json: {message: "OK"}.to_json
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
