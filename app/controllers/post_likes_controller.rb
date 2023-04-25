class PostLikesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @post_like = current_user.post_likes.new(post_like_params)
    if !@post_like.save
      flash[:alert] = "You already liked this post"
    end
    @post = Post.find_by(id: @post_like.post_id)
    redirect_to post_path(@post)
  end

  def destroy
    @post_like = current_user.post_likes.find(params[:id])
    @post_like.destroy
    redirect_to post_path(@post_like.post)
  end

  def post_like_params
    params.require(:post_like).permit(:post_id)
  end
end
