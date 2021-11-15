class PasswordResetsController < ApplicationController
  def new
   

  end
  def user_find
    @user=User.find_by(email: params[:password_question][:email])
    if @user.password_answers.find_by(password_question_id: params[:password_question][:select], answer: params[:password_question][:answer])
      redirect_to pass_edit_path
    else
      render :new
    end
  end

  def edit
  end
end
