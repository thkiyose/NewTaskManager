class SessionsController < ApplicationController
  before_action :cannot_do_when_logged_in, only:[:new,:create]
  before_action :cannot_do_when_logged_out, only:[:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
     session[:user_id] = user.id
     redirect_to user_path(user.id), notice: "ログインに成功しました。おかえりなさい、#{user.name}!"
   else
     render :new
   end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: "ログアウトしました。また来てね"
  end

  private

    def cannot_do_when_logged_in
      if session[:user_id]
        redirect_to user_path(session[:user_id])
      end
    end

    def cannot_do_when_logged_out
      if !session[:user_id]
        redirect_to new_session_path
      end
    end
end
