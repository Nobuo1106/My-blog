class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_userid(params[:userid])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice:
      " #{user.userid}様、サインインに成功しました。"
    else
      render 'new', alert:
      "ユーザーID  か パスワードが無効です。"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice:
    "ログアウトに成功しました。"
  end
end
