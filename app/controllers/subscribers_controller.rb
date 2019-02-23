class SubscribersController < ApplicationController
  http_basic_authenticate_with name: "nobuo", password: "pokopoko", except: [:create]

  def index
    @subscribers = Subscriber.all
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if Subscriber.exists?(email: @subscriber.email)
      redirect_to root_path, alert:
      "こちらのメールアドレスは既に登録されています"
    elsif
      @subscriber.save
      redirect_to root_path, notice:
      " #{@subscriber.f_name}様、購読ありがとうございます。 "
    else
      redirect_to root_path, alert:
      "登録に失敗しました。もう一度登録をお願いします。"
    end
  end

def destroy
  @subscriber = Subscriber.find(params[:id])
  @subscriber.destroy

  redirect_to subscribers_path
end

  private
    def subscriber_params
      params.require(:subscriber).permit(:f_name, :l_name, :email, :country)
    end
end
