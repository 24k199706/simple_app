class UsersController < ApplicationController
  def show
    @user=User.find(params[:user])
  end
  def new
    @user=User.new
  end
  def creat
    @user=User.new(params[:user])
    if User.save
      
    else
      render "new"  
    end
  end
  def index
  end
  def edit
  end

  
end
