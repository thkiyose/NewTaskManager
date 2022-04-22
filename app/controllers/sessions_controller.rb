class SessionsController < ApplicationController
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
end
