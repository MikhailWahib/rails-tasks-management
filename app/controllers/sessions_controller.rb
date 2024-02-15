class SessionsController < ApplicationController
  before_action :authenticate_user, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash.now[:danger] = 'Invalid email or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
