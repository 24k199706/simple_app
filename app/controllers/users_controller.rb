class UsersController < ApplicationController
  def show
    p "==================="
    p params
    p "==================="
    @user=User.find(params[:id])
  end
  def new
    @user=User.new
  end
  def creat
    p "==================="
    p params
    p "==================="
    @user=User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Simple_App!"
      redirect_to @user
    else
      puts @user.errors.full_messages
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
