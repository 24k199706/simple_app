class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update ,:following, :followers]
  before_action :correct_user,   only: [:edit, :update]
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
  def creat
    @user=User.new(user_params)
    p "==================="
    p params
    p "==================="
    if @user.save
      log_in @user
      remember @user
      flash[:success] = "Welcome to the Simple_App!"
      redirect_to root_path
    else
      puts @user.errors.full_messages
      render "new"
    end
  end
  #ユーザの論理削除の検証→今後削除予定(退会ボタンを押したら論理削除されるようにするため)
  def index
    
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
    redirect_to root_path
  end
  #プロフィール編集画面
  def edit
    if params[:name]
      @user = User.find_by(name: params[:name])
    else
      @user=User.find(current_user.id)
    end
    p "==================="
    p params
    p "==================="

  end
  #プロフィール更新処理
  def update
    @user = User.find_by(name: params[:name])
    p "==================="
    p @user.errors.full_messages
    p "==================="
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
    def correct_user
      @user = User.find_by(name: params[:name])
      redirect_to(root_url) unless @user == current_user
    end

end
