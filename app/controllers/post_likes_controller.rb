class PostLikesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @post_like = current_user.post_likes.new(post_like_params)
    @post = Post.find_by(id: @post_like.post_id)
    if @post_like.save
      render :create
    else
      flash.now[:alert] = "You already liked this post"
      render turbo_stream: turbo_stream.replace(@post, partial: "posts/post", locals: { post: @post })
    end
  end

  def destroy
    @post_like = current_user.post_likes.find(params[:id])
    @post = @post_like.post
    @post_like.destroy
    render :destroy
  end

  def post_like_params
    params.require(:post_like).permit(:post_id)
  end
end
