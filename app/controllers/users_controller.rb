class UsersController < ApplicationController
  before_action :logged_in?, only: [:edit, :update ,:following, :followers]
  
  #プロフィール画面のコントローラ側
  def show
    if params[:name]
      @user = User.find_by(name: params[:name])
    else
      @user=User.find(current_user.id)
    end
    p "==================="
    p params
    p "==================="
  end
  #新規登録画面のコントローラ側
  def new
    @user=User.new
  end
  #新規登録の処理
  def create
    @user=User.new(user_params)
    p "==================="
    p params
    p "==================="
    if @user.save
      password_user=PasswordAnswer.new(answer: params[:user][:reset_answer], password_question_id: params[:user][:reset_question],user_id: @user.id)
      password_user.save
      log_in @user
      remember @user
      flash[:success] = "Welcome to the Simple_App!"
      redirect_to root_path
    else
      puts @user.errors.full_messages
      render "new"
    end
  end

  def renew

  end

  def reupdate#再登録処理
    @user = User.find_by(email: params[:renew][:email])
    if @user
      @user.resign = false
      @user.save
      log_in @user
      redirect_to root_path
    end
  end


  #論理削除の処理
  def resign
    user=User.find_by(id:params[:id])
      user.posts.each do|post|
        post.delete_flg =true
        post.save
      end
    user.resign =true
    user.save
    log_out
    redirect_to root_path
  end
  #プロフィール編集画面
  def edit
      @user = User.find_by(id: params[:id])
  end
  #プロフィール更新処理
  def update
    @user = User.find_by(id: params[:id])
    
    if @user.update(user_params)
      p "==================="
      p "成功"
      p "==================="
      redirect_to user_path(@user.name)
    else
      render "edit"
    end
  end
  
  private
    #strongparams設定
    def user_params
      params.require(:user).permit(:name, :email, :password,:content, :image,
                                   :password_confirmation,:remove_img)
    end
    #以下beforeアクションのメソッド
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    

end
