class SimplesController < ApplicationController
  def home
    if logged_in?
    @post = Post.where(delete_flg: nil).or(Post.where.not(delete_flg: true))
    @user=User.where(resign: false).or(User.where(resign: nil))
    p "==================="
    p @post
    p "==================="
    end
  end
end
