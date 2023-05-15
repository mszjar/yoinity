class CommentReplyLikesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @comment_reply_like = current_user.comment_reply_likes.new(comment_reply_like_params)
    if !@comment_reply_like.save
      flash[:alert] = "You already liked this comment_reply"
    end
    @comment_reply = CommentReply.find_by(id: @comment_reply_like.comment_reply_id)
    @comment = @comment_reply_like.comment_reply.comment
    redirect_to comment_path(@comment)
  end

  def destroy
    @comment_reply_like = current_user.comment_reply_likes.find(params[:id])
    @comment = @comment_reply_like.comment_reply.comment
    @comment_reply_like.destroy
    redirect_to comment_path(@comment)
  end

  def comment_reply_like_params
    params.require(:comment_reply_like).permit(:comment_reply_id)
  end
end
