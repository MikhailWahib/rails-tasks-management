class HomeController < ApplicationController
  before_action :authenticate_user

  def index
    @user = User.find(session[:user_id])
    @tasks = @user.tasks
  end
end
