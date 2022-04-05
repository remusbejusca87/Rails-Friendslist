class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]

    def index
        @categories = Category.all

        cate = params[:cate]

        if !cate.nil?
            @posts = Post.where(:category_id => cate)
        else
            @posts = Post.all.order('created_at DESC')
        end
    end

    def new
        #@post = Post.new
        @post = current_user.posts.build
    end

    def create
        #@post = Post.new(post_params)
        @post = current_user.posts.build(post_params)
        
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    def correct_user
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to posts_path, notice: "Not Authorized To Edit or Delete This Post!" if @post.nil?
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id, :category_id)
    end
end
