class PostQualitiesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @post_quality = current_user.post_qualities.new(post_quality_params)
    if !@post_quality.save
      flash[:alert] = "You already found quality in this post"
    end
    @post = Post.find_by(id: @post_quality.post_id)
    redirect_to post_path(@post)
  end

  def destroy
    @post_quality = current_user.post_qualities.find(params[:id])
    @post_quality.destroy
    redirect_to post_path(@post_quality.post)
  end

  def post_quality_params
    params.require(:post_quality).permit(:post_id)
  end
end
