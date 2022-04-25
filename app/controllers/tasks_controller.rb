class TasksController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :cannot_do_when_logged_out, only:[:index]

  def index
    @tasks = @user.tasks
  end

  private

  def set_user
    @user = User.find_by(id:session[:user_id])
  end
end
