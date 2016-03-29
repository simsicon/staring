class SessionsController < ApplicationController
  def create
    user = User.find_by_username(login_params[:username])
    if user.present? && user.authenticate(login_params[:password])
      sign_in(user)
      redirect_to root_path
    else
      flash[:error] = "登陆失败，用户名或者密码错误!"
      redirect_to :back
    end
  end

  def destroy
    sign_out if current_user
    redirect_to :back
  end

  private
  def login_params
    params.require(:user).permit(:username, :password)
  end
end
