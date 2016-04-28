class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery except: [:sort,:destroy]

  before_action :configure_permitted_parameters,if: :devise_controller?
  before_action :authenticate_user!, except: :top

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:account_update) << :name
    end
    #def authenticate_user!
    #  unless logged_in?
    #    flash[:alert] = 'ログインしてください'
    #    redirect_to login_path
    #  end
    #end

end
