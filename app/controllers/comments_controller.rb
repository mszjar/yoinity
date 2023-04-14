class CommentsController < ApplicationController
  before_action :set_post, only: %i[show destroy create new]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    authorize @comment
  end

  def create
    @comment = Comment.new(params_comment)
    @comment.post = @post
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show", status: :unprocessable_entity
    end

  end

  def show
  end

  def delete
    @comment = Comment.find(params[:post_id])
    @comment.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def params_comment
    params.require(:comment).permit(:title, :content, :rating, :user_id, :post_id)
  end
end
