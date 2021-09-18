class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create ,:destroy]
    def new
        @post=Post.new
    end
    def creat
        @post=current_user.posts.build(posts_params)
        if @post.save
            redirect_to root_path
        else
            render "posts_new"    
        
        end
    end
    private
        def posts_params
            params.require(:post).permit(:content ,:title)
        end
end
