class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def create
    log_out  if logged_in?
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:alert] = '名前とパスワードが正しくありません'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to new_user_session_path
  end
end
