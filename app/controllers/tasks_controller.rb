class TasksController < ApplicationController
  before_action :set_user, only: [:index,:new,:create]
  before_action :cannot_do_when_logged_out, only:[:index,:new,:create, :show, :destroy]

  def index
    @tasks = @user.tasks
  end

  def new
    @task = @user.tasks.build
  end

  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを追加しました。"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path, notice: "タスクを削除しました。"
  end

  private

  def set_user
    @user = User.find_by(id:session[:user_id])
  end

  def task_params
    params.require(:task).permit(:title,:importance,:limit,:detail)
  end
end
