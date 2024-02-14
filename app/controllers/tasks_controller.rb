class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    @task.is_done = false
    @task.user_id = session[:user_id]

    if @task.save
      redirect_to home_path
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])

    if @task.user_id != session[:user_id]
      redirect_to home_path
    end

    render :edit
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to home_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to home_path
  end

  def toggle_status
    @task = Task.find(params[:id])
    @task.is_done = !@task.is_done
    @task.save
    redirect_to home_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :desc)
  end
end
