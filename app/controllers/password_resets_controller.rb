class PasswordResetsController < ApplicationController
  def new
   

  end
  def user_find
    @user=User.find_by(email: params[:password_question][:email])
    if @user.password_answers.find_by(password_question_id: params[:password_question][:select], answer: params[:password_question][:answer])
      redirect_to pass_edit_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user=User.find_by(id: params[:user_id])
  end
  def update
    p "==========="
    p params
    p "==========="
    @user = User.find(params[:user_id])
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      log_in @user
      remember @user
      redirect_to root_path
    else
      p "=============="
      p @user.errors.full_messages
      p "=============="
      render :edit
    end
  end
end
