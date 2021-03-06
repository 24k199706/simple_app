class SessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.resign != true
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to root_path
      else
        flash.now[:danger] = 'Invalid name/password combination'
        render "new"
      end
    else
      redirect_to renew_path
    end
  end
  def destroy
    #トークンでログインしているときにログアウトできるようにする
    log_out if logged_in?
    redirect_to root_path
  end
end
