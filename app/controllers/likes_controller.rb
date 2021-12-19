class LikesController < ApplicationController
    #いいね処理
    def post_create
        @like=Like.new(user_id: params[:user_id] , post_id: params[:post_id])
        like_create(@like)
        
    end
    def comment_like_create
        @like=Like.new(user_id: params[:user_id] , comment_id: params[:comment_id])
        @like.save
    end
    def destroy
        @like = Like.find_by(post_id: params[:post_id], user_id: params[:user_id])
        @like.destroy
        redirect_to posts_show_path(params[:post_id])
    end
    def comment_like_destroy
        @like = Like.find_by(comment_id: params[:comment_id], user_id: params[:user_id])
        @like.destroy
        redirect_to posts_show_path(params[:comment_id])
    end
    def like_create(like)
        if like.save
            @post=Post.find_by(params[:post_id])
            @post.create_notification_by(current_user,"like")
            respond_to do |format|
                format.html {redirect_to request.referrer}
                format.js
            end
        else
            render "posts/show"
            p "==================="
            p @like.errors.full_messages
            p "==================="
        end
    end
    def like_comment_create(like)
        if like.save
            redirect_to posts_show_path(params[:comment_id])
        else
            render "posts/show"
            p "==================="
            p @like.errors.full_messages
            p "==================="
        end
    end
end