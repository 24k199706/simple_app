class SessionsController < ApplicationController
  def new

  end
  def creat
    user = User.find_by(email: params[:session][:email].downcase)
    p "==================="
    p params
    p "==================="
    if user && user.authenticate(params[:session][:password])
    # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid name/password combination'
      render "new"
    end
  end
  def destory
    #トークンでログインしているときにログアウトできるようにする
    log_out if logged_in?
    redirect_to root_path
  end
end
