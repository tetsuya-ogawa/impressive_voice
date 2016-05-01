class AdminController < ApplicationController

  before_action :check_admin!

  private
    def check_admin!
      redirect_to home_path unless current_user_admin?
    end

    #Todo あとでモジュール化
    def current_user_admin?
      if current_user.admin
        true
      else
        false
      end
    end

end