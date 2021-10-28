class likesController < ApplicationController
    #いいね処理
    def creat
        @like=Like.new(like_params)
        if @like.save
            redirect_to root_path
        else
            render "posts/show"    
        end
    p "==================="
    p @like.errors.full_messages
    p "==================="
    end
    def destory
        @like.destroy
            redirect_to  root_path
        end
    end

    private
    def like_params
        params.require(:like).permit(:comment_id , :user_id ,:post_id)

    end
end