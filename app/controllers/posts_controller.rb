class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create ,:destroy]
    def new
        @post=Post.new
    end
    def creat
        @post=current_user.posts.build(posts_params)
    p "==================="
    p @post.errors.full_messages
    p "==================="
        if @post.save
            redirect_to index_path
        else
            render "posts_new"    
        
        end
    end
    def show
        @post=Post.find_by(params[:id])
        
    end
    private
        def posts_params
            params.require(:post).permit(:content ,:title, :user_id)
        end
end
