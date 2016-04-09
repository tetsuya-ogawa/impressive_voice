class HomeController < ApplicationController

  layout 'public_page'
  #skip_before_action(authenticate_user!)


  def index
  end

  def top
    if user_signed_in?
      redirect_to home_path
    else
      render :layout => 'top'
    end
  end


end
