class SessionsController < ApplicationController
  def new

  end
  def creat
    user = User.find_by(email: params[:session][:email].downcase)
    p "==================="
    p params
    p "==================="
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid name/password combination'
      render "new"
    end
  end
  def destory
    log_out
    redirect_to root_path
  end
end
