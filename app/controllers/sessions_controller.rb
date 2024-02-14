class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: session_params[:email])

    if @user
      if @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
        redirect_to home_path
      else
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def redirect_if_logged_in
    redirect_to home_path if session[:user_id].present?
  end
end
