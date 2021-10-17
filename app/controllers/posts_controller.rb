class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create ]
    before_action :correct_user,   only: :destroy
    def new
        @post=Post.new
    end
    def creat
        @post=current_user.posts.build(posts_params)
    p "==================="
    p @post.errors.full_messages
    p "==================="
        if @post.save
            redirect_to root_path
        else
            render "posts_new"    
        
        end
    end
    def show
        @post=Post.find(params[:id])
        @comment=Comment.new
        p "==================="
        p @comment
        p "==================="
    end
    def edit
        @post=Post.find_by(params[:id])
        p "==================="
        p @post
        p "==================="
    end

    def update
        @post = current_user.posts.find(params[:id])
        p "==================="
        p @post.errors.full_messages
        p "==================="
        if @post.update(posts_params)
            redirect_to root_path
        else
            render "edit"
        end
    end
    def destroy
        @post.destroy
        flash.now[:success] = "投稿を削除しました。"
        redirect_to  root_url
    end

    private
        def posts_params
            params.require(:post).permit(:content ,:title)
        end

        def correct_user
            @post = current_user.posts.find_by(id: params[:id])
            redirect_to root_url if @post.nil?
        end
end
