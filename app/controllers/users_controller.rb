class UsersController < ApplicationController
  def show
    @user=User.find(params[:user])
  end
  def new
    @user=User.new
  end
  def creat
    @user=User.new(user_params)
    if User.save
      flash[:success] = "Welcome to the Simple_App!"
      redirect_to @user
    else
      render "new"
    end
  end
  def index
  end
  def edit
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


end
