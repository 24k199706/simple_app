class SimplesController < ApplicationController
  def home
    if logged_in?
      @post=Post.all
    p "==================="
    p @post
    p "==================="
    end
  end
end
