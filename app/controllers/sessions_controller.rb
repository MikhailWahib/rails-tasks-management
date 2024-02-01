class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new, :create]
  
    def create
      @user = User.find_by(email: params[:session][:email])
  
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to home_path
      else
        redirect_to login_path, alert: 'Invalid email/password combination'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to login_path, notice: 'Logged out successfully.'
    end
  
    private
  
    def redirect_if_logged_in
      redirect_to tasks_path if session[:user_id].present?
    end
  end
  