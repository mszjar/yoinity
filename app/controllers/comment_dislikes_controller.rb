class CommentDislikesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @comment = Comment.find_by(id: params[:comment_dislike][:comment_id])
    if @comment
      @comment_dislike = current_user.comment_dislikes.new(comment_dislike_params)
      if @comment_dislike.save
        redirect_to comment_path(@comment)
      else
        flash[:alert] = "You already downvote this review"
        redirect_to comment_path(@comment)
      end
    else
      flash[:alert] = "Comment not found"
      redirect_to "/posts"
    end
  end

  def destroy
    @comment_dislike = current_user.comment_dislikes.find(params[:id])
    @comment_dislike.destroy
    redirect_to comment_path(@comment_dislike.comment)
  end

  def comment_dislike_params
    params.require(:comment_dislike).permit(:comment_id)
  end
end
