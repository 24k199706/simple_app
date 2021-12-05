class PostsController < ApplicationController
    before_action :logged_in?, only: [:create] 
    before_action :correct_user,   only: :destroy
    def new
        @post=Post.new
        
    end
    def create
        @post=current_user.posts.build(posts_params)
        @tag=Tag.find_by(name: params[:tag][:name])
        if @tag==nil
            @tag=Tag.create(name: params[:tag][:name])
        end
        if @post.save
            Posttag.create(post_id: @post.id,tag_id: @tag.id)
            redirect_to root_path
        else
            render "posts_new"    
        
        end
    end
    def hashtag
        @tag = Tag.find_by(name: params[:name])
        p "============="
        p @tag
        p "============="
        @posttags = @tag.posttags
    end

    def show
        @post=Post.find(params[:id])
        @comment=Comment.new
        @like=Like.new
        @comment_delete = Comment.where(delete_flg: nil).or(Comment.where.not(delete_flg: true))
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
        @post.delete_flg = true
        @post.save
        flash.now[:success] = "投稿を削除しました。"
        redirect_to  root_url
    end


    private
        def posts_params
            params.require(:post).permit(:content ,:title, :image)
        end

        def correct_user
            @post = current_user.posts.find_by(id: params[:id])
            redirect_to root_url if @post.nil?
        end
end
