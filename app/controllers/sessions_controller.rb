class SessionsController < ApplicationController
  before_action :cannot_do_when_logged_in, only:[:new,:create]
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect_to user_path(user.id), notice: "ログインに成功しました。おかえりなさい、#{user.name}!"
   else
     render :new
   end
  end

  private
    def current_user
      current_user ||= User.find(session[:user_id])
    end

    def cannot_do_when_logged_in
      if current_user
        redirect_to user_path(current_user.id)
      end
    end
end
