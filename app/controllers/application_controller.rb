class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||=User.find_by_id(session[:user_id]) if session[:user_id]
  end

  # ヘルパーメソッドの呼び出し
  helper_method :current_user
  # サインインしていない場合
  def authorize
    redirect_to new_session_path, alert: 'サインインもしくはユーザー登録して下さい。' if current_user.nil?
  end
  # 一般ユーザーの場合
  def admin_authorize
    redirect_to new_session_path,
    alert: "Only for Admin!" unless current_user.admin
  end
end
