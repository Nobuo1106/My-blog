class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_path, notice:
      " #{@user.userid}様ようこそ! ユーザー作成が完了しました。"
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:userid, :email, :password, :password_confirmation)
  end
end
