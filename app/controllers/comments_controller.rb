class CommentsController < ApplicationController
    #返信処理
    def creat
        @comment=Comment.new(comment_params)
        if @comment.save
            redirect_to posts_show_path
        else
            render "posts/show"    
        
        end
    p "==================="
    p @comment.errors.full_messages
    p "==================="
    end
    def destory
        @comment=Comment.find_by(user_id: params[:user_id] , post_id: params[:post_id])
        @comment.regin= true
        @comment.save
        flash.now[:success] = "投稿を削除しました。"
        redirect_to posts_show_path
    end

    private
    def comment_params
        params.require(:comment).permit(:comment_content , :user_id ,:post_id)

    end
end
