class LikesController < ApplicationController
    #いいね処理
    def post_creat
        @like=Like.new(user_id: params[:user_id] , post_id: params[:post_id])
        like_creat(@like)
        
    end
    def comment_creat
        @like=Like.new(user_id: params[:user_id] , comment_id: params[:comment_id])
        like_comment_creat(@like)
        
    end
    def destroy
        @like = Like.find_by(post_id: params[:post_id], user_id: params[:user_id])
        @like.destroy
        redirect_to  posts_show_path(params[:post_id])
       
    end
    def comment_like_destroy
        @like = Like.find_by(comment_id: params[:comment_id], user_id: params[:user_id])
        @like.destroy
        redirect_to  posts_show_path(params[:comment_id])  
    end
    
    def like_creat(like)
        if like.save
            redirect_to posts_show_path(like.post_id)
        else
            render "posts/show"
            p "==================="
            p @like.errors.full_messages
            p "==================="
        end
    end
    def like_comment_creat(like)
        if like.save
            redirect_to posts_show_path(like.comment_id)
        else
            render "posts/show"
            p "==================="
            p @like.errors.full_messages
            p "==================="
        end
    end
end