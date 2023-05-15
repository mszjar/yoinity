class CommentLikesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @comment = Comment.find_by(id: params[:comment_like][:comment_id])
    if @comment
      @comment_like = current_user.comment_likes.new(comment_like_params)
      if @comment_like.save
        redirect_to comment_path(@comment)
      else
        flash[:alert] = "You already liked this review"
        redirect_to comment_path(@comment)
      end
    else
      flash[:alert] = "Comment not found"
      redirect_to "/posts"
    end
  end

  def destroy
    @comment_like = current_user.comment_likes.find(params[:id])
    @comment_like.destroy
    redirect_to comment_path(@comment_like.comment)
  end

  def comment_like_params
    params.require(:comment_like).permit(:comment_id)
  end
end
