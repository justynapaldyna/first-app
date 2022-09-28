class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    def index
      @comments = Comment.all
      @comment = Comment.new
    end

    def new
      @comment = Comment.new
    end

    def edit
      @comment = Comment.find(params[:id])
    end

    def create
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        redirect_to comments_path
      else
        render :new
      end
    end



    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to comments_path
      else
        render :edit
      end
    end

    def show
      @comment = Comment.find(params[:id])
    end

    def destroy
      @comment = Comment.find(params[:id])
      if @comment.destroy
        flash[:notice] = 'Comment has been destroyed'  
      else
        flash[:alert] = 'Something went wrong'
      end
      redirect_to comments_path
    end

    private

    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end   
end
