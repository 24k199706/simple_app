class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def show
    p "==================="
    p params
    p "==================="
    @user=User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
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
      remember @user
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
    p "==================="
    p params
    p "==================="
  end 
  def update
    @user = User.find(params[:id])
    p "==================="
    p @user.errors.full_messages
    p "==================="
    if @user.update(user_params)
      redirect_to @user
    else
      render "edit"
    end
    

  end


  private
    #strongparams設定
    def user_params
      params.require(:user).permit(:name, :email, :password,:content, :image,
                                   :password_confirmation)
    end
    #以下beforeアクションのメソッド
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end
