class UsersController < ApplicationController
  before_action :set_user, only: :show
  before_action :cannot_do_when_logged_in, only: [:new,:create]
  before_action :cannot_do_when_logged_out, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: "ユーザー登録しました。ようこそ、#{@user.name}さん！"
    else
      render :new
    end
  end

  def show
    if @user.id != session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
