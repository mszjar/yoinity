class PostQualitiesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @post_quality = current_user.post_qualities.new(post_quality_params)
    @post = Post.find_by(id: @post_quality.post_id)
    if @post_quality.save
      render :create
    else
      flash.now[:alert] = "You already marked this post as quality"
      render turbo_stream: turbo_stream.replace(@post, partial: "posts/post", locals: { post: @post })
    end
  end

  def destroy
    @post_quality = current_user.post_qualities.find(params[:id])
    @post = @post_quality.post
    @post_quality.destroy
    render :destroy
  end

  def post_quality_params
    params.require(:post_quality).permit(:post_id)
  end
end
