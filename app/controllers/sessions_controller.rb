class SessionsController < ApplicationController
  def new
  end
  # フォーム値の受け取り
  def create
    user = User.find_by_userid(params[:userid])
    if user && user.authenticate(params[:password])
      # ユーザーをサインインさせ、root_pathにリダイレクトさせる。
      session[:user_id] = user.id
      redirect_to root_path, notice:
      " #{user.userid}様、サインインに成功しました。"
    else
      # エラーメッセージを表示し、サインイン画面に戻る
      render 'new', alert:
      "ユーザーID  か パスワードが無効です。"
    end
  end

  # ログアウト
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice:
    "ログアウトに成功しました。"
  end
end
