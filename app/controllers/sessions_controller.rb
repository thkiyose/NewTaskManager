class SessionsController < ApplicationController
  before_action :cannot_do_when_logged_in, only:[:new,:create]
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

  private

    def cannot_do_when_logged_in
      if session[:user_id]
        redirect_to user_path(session[:user_id])
      end
    end
end
