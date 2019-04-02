require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

  private

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  helper_method(:current_user)

  def user_signed_in?
    current_user.present?
  end

  helper_method(:user_signed_in?)

  def authenticate_user!
    unless user_signed_in?
      flash[:danger] = "You must sign in or sign up first"
      redirect_to new_sessions_path
    end
  end
end
