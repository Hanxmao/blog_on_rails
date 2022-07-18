class CommentsController < ApplicationController
    before_action :find_post

    def create
        @comment = Comment.new(params.require(:comment).permit(:body))
        @comment.post = @post
        if @comment.save
            flash[:notice] = "New comment created!"
            redirect_to post_path(@post)
        else
            @comments = Comment.order(created_at: :desc)
            render "posts/show", status: 303
        end
    end

    def destroy
        @comment = Comment.find params[:id]
        @comment.destroy
        redirect_to post_path(@post)
        
    end

    private

    def find_post
        @post = Post.find params[:post_id]
    end
end
