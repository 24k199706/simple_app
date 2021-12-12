class LikesController < ApplicationController
    #いいね処理
    def post_create
        @like=Like.new(user_id: params[:user_id] , post_id: params[:post_id])
        @like.save
        
    end
    def comment_like_create
        @like=Like.new(user_id: params[:user_id] , comment_id: params[:comment_id])
        @like.save
    end
    def destroy
        @like = Like.find_by(post_id: params[:post_id], user_id: params[:user_id])
        @like.destroy
    end
    def comment_like_destroy
        @like = Like.find_by(comment_id: params[:comment_id], user_id: params[:user_id])
        @like.destroy
        redirect_to posts_show_path(params[:comment_id])
    end
    
end