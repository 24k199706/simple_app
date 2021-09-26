class SimplesController < ApplicationController
  def home
    if logged_in?
      @post=Post.where(user_id: 1)
    end
  end
end
