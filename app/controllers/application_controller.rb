class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?, :sign_in, :sign_out

  def current_user
    @current_user ||= begin
      session[:current_user_id].present? ? User.find(session[:current_user_id]) : nil
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    raise "invalid signin user" unless user && user.valid? && !user.new_record?
    session[:current_user_id] = user.id
  end

  def sign_out
    raise "invalid signout" unless session[:current_user_id]
    session.delete :current_user_id
  end
end
