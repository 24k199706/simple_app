class CommentsController < ApplicationController
    #返信処理
    def create
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
    def destroy
        @comment=Comment.find_by(id: params[:id])
        @comment.resign= true
        @comment.save
        flash.now[:success] = "投稿を削除しました。"
        redirect_to posts_show_path(@comment.post.id)
    end

    private
    def comment_params
        params.require(:comment).permit(:comment_content , :user_id ,:post_id)

    end
end
