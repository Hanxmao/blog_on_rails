class PostsController < ApplicationController
    before_action :find_post, only: [:show, :destroy, :edit, :update]


    #========= listing of posts=====
    def index
        @posts = Post.order(created_at: :desc)
    end
    #========= individual post =======
    def show
        @comments = @post.comments.order(created_at: :desc)
        @comment = Comment.new
    end

    #========= create new post ===========
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice]= "New post created!"
            redirect_to post_path(@post)
        else
            render :new
        end
    end
    #=========delete posts =========
    def destroy
        @post.destroy
        redirect_to posts_path
    end
    #===========edit post =======
    def edit

    end

    def update
        if @post.update(post_params)
            flash[:notice]= "Post updated!"
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    #=======private method=============
    def find_post 
        @post = Post.find params[:id]
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
