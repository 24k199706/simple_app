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
    @user=User.new(user_params)
    p "==================="
    p params
    p "==================="
    if @user.save
      log_in @user
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
    @user = User.find(params[:id])
  end 
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      redirect_to show_path
    else
      render "edit"
    end
    

  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :content,
                                   :password_confirmation)
    end

end
