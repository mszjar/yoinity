class CommentRepliesController < ApplicationController
  before_action :set_comment, only: [:create]
  before_action :set_comment_reply, only: [:destroy]

  def create
    @comment_reply = @comment.comment_replies.new(comment_reply_params)
    @comment_reply.user = current_user
    authorize @comment_reply

    if @comment_reply.save
      redirect_to post_path(@comment.post), notice: 'Reply was successfully created.'
    else
      redirect_to post_path(@comment.post), alert: 'Error creating reply.'
    end
  end

  def destroy
    authorize @comment_reply
    @comment_reply.destroy
    redirect_to @comment_reply.comment.post, notice: 'Reply was successfully deleted.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def set_comment_reply
    @comment_reply = CommentReply.find(params[:id])
  end

  def comment_reply_params
    params.require(:comment_reply).permit(:content)
  end
end
