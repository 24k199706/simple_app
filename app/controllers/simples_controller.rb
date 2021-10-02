class SimplesController < ApplicationController
  def home
    if logged_in?
      @post=Post.all
    end
  end
end
