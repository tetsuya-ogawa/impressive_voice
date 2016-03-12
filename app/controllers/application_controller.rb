class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery :except => [:destroy]
  include SessionsHelper
  before_action :authenticate_user!

  private
    def authenticate_user!
      unless logged_in?
        flash[:alert] = 'ログインしてください'
        redirect_to login_path
      end
    end

end
