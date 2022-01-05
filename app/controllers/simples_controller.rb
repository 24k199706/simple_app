class SimplesController < ApplicationController
  def home
    if logged_in?
    @post = Post.where(delete_flg: nil).or(Post.where.not(delete_flg: true))
    @post = @post.order(created_at: :desc)
    end
  end
end
