class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @posts = Posts::Sort.new(Posts::Recent.call).call.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Posts::Create.new(post_params).call
    redirect_to posts_path
    rescue ActiveRecord::RecordInvalid => invalid
      @post = invalid.record
      render :new
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def show
    @comments = Comments::Sort.new(Comments::Post.new(@post.id).call).call
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post has been destroyed'
      redirect_to posts_path
    else
      flash[:alert] = 'Something went wrong'
      redirect_to posts_path
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :image)
  end
end
