class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def show
        user_id = session[:user_id]

        if user_id.present?
            @user = User.find_by(id: user_id)

            @tasks = @user.tasks if @user
        else
            redirect_to login_path
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        # check if email already exists
        existing_user = User.find_by(email: @user.email)

        if existing_user
            # display error
        else
            if @user.save
                redirect_to login_path
            else
                render :new
            end
        end
    end

    def tasks
        @user = User.find(params[:id])
        @tasks = @user.tasks
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def redirect_if_logged_in
        redirect_to home_path if session[:user_id].present?
    end
end
