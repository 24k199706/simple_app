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
        @comment.destroy
            flash.now[:success] = "返信を削除しました。"
            redirect_to  posts_show_path
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:comment_content , :user_id ,:post_id)

    end
end
