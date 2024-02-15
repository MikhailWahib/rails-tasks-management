class ApplicationController < ActionController::Base
  private

  def authenticate_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end
end
