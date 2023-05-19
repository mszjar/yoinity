class CommentsController < ApplicationController
  before_action :set_post, only: %i[show destroy create new]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @post = Post.find_by!(token: params[:token])
    authorize @comment
  end

  def create
    @comment = Comment.new(params_comment)
    @comment.post = @post
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to post_path(@post.token)
    else
      render "posts/show", status: :unprocessable_entity
    end

  end

  def show
  end

  def delete
    authorize @comment
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def set_post
    @post = Post.find_by!(token: params[:token])
  end

  def params_comment
    params.require(:comment).permit(:title, :content, :user_id, :post_id)
  end
end
