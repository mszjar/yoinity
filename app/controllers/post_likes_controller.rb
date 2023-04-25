class PostLikesController < ApplicationController
  skip_after_action :verify_authorized
  
  def create
    @post_like = current_user.post_likes.new(post_like_params)
    if !@post_like.save
      flash[:alert] = "You already liked this post"
    end
  end

  def destroy
    @post_like = current_user.post_likes.find(params[:id])
    @post_like.destroy
  end

  def post_like_params
    params.require(:post_like).permit(:post_id)
  end
end
