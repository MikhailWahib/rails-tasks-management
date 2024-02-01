class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new, :create]

    def show
        user_id = session[:user_id]

        if user_id.present?
            @user = User.find_by(id: user_id)

            if @user
                @tasks = @user.tasks
            else
                redirect_to root_path
            end
            else
                redirect_to root_path
            end
        end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to login_path
        else
            render :new
        end
    end

    def tasks
        @user = User.find(params[:id])
        @tasks = @user.tasks
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def redirect_if_logged_in
        redirect_to tasks_path if session[:user_id].present?
      end
end
