class CommentsController < ApplicationController
    #返信処理
    def creat
        if @comment.save
            redirect_to posts_show_path
        else
            render "posts/show"    
        
        end
    p "==================="
    p @comment.errors.full_messages
    p "==================="
    end

    private
    def comment_params
        params.require(:comment).permit(:comment_content)

    end
end
