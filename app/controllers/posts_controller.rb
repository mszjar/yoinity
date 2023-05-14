class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update show destroy]

  def index
    @post = policy_scope(Post)

    if params[:query].present?
      @posts = Post.search(params[:query])
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(params_post)
    @post.user = current_user
    authorize @post
    if @post.save
      # sleep 3
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @post
    @comment = Comment.new
    @comments = @post.comments
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  def update
    @post.user = current_user
    @post.update(params_post)
    redirect_to post_path(@post)
  end

  def edit
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def params_post
    params.require(:post).permit(:title, :content, :url, :language, :country, :photo)
  end
end
