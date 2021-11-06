class LikesController < ApplicationController
    #いいね処理
    def post_creat
        @like=Like.new(user_id: params[:user_id] , post_id: params[:post_id])
        like_creat(@like)
        
    end
    def comment_creat
        @like=Like.new(user_id: params[:user_id] , post_id: params[:post_id])
        like_creat(@like)
        
    end
    def destroy
        @like = Like.find_by(post_id: params[:post_id], user_id: params[:user_id])
        @like.destroy
        redirect_to  posts_show_path
        
        
    end

    
    def like_creat(like)
        if like.save
            redirect_to posts_show_path
        else
            render "posts/show"
            p "==================="
            p @like.errors.full_messages
            p "==================="
        end
    end
end