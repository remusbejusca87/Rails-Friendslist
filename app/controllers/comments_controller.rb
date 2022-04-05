class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only: [:destroy]

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :content, :user_id))
        redirect_to post_path(@post)
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    def correct_user
        @comment = current_user.comments.find_by(id: params[:id])
        redirect_to posts_path, notice: "Not Authorized To Delete This Comment!" if @comment.nil?
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :comment, :user_id)
    end

end
