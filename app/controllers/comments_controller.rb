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
      flash[:notice] = 'Your review was successfully created.'
      redirect_to post_path(@post.token)
    else
      flash.now[:alert] = 'There was a problem creating your review.'
      render "posts/show", status: :unprocessable_entity
    end
  end

  def show
  end

  def delete
    authorize @comment
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = 'Your review was successfully deleted.'
      redirect_to posts_path
    else
      flash.now[:alert] = 'There was a problem deleting your review.'
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find_by!(token: params[:comment][:post_token])
  end


  def params_comment
    params.require(:comment).permit(:content)
  end
end
