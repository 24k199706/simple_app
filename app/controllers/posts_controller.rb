class PostsController < ApplicationController
    before_action :logged_in?, only: [:create] 
    before_action :correct_user,   only: :destroy
    def new
        @post=Post.new
        
    end
    def create
        @post=current_user.posts.build(posts_params)
        #split関数で分ける
        result=[]
        if params[:tag][:name].include?("　")
            result=params[:tag][:name].split("　")   
        elsif params[:tag][:name].include?(" ")
            result=params[:tag][:name].split(" ") 
        else
            result=params[:tag][:name]
        end
        p "====================="
        p result
        p "====================="
        @tag=[]
        if result.instance_of?(Array)
            result.each do|f|
                if Tag.find_by(name: f)
                    @tag.push(Tag.find_by(name: f)) 
               else
                @tag.push(f)
               end
            end
        else
            @tag=Tag.find_by(name: params[:tag][:name])  
        end
        p "====================="
        p @tag
        p "====================="
        @tag_result=[]
        if @tag.instance_of?(Array)
            @tag.each do|t|
                if t.instance_of?(String)
                    @tag_result.push(Tag.create(name: t))
                    p "string"
                    p t
                    p "string"
                else
                    @tag_result.push(t)
                    p "hash"
                    p t
                    p "hash"
                end
            end
        else
            if @tag == nil
                @tag_result = Tag.create(name: params[:tag][:name])
            else
                @tag_result = @tag
            end
        end
        
        if @post.save
            if @tag_result.instance_of?(Array)
                @tag_result.each do |tag|
                  Posttag.create(post_id: @post.id,tag_id: tag.id)
                end
            else
                Posttag.create(post_id: @post.id,tag_id: @tag_result.id)
            end
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
