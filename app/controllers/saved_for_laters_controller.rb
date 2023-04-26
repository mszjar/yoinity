class SavedForLatersController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @saved_posts = current_user.saved_posts.includes(:post)
  end

  def create
    @saved_for_later = current_user.saved_for_laters.new(saved_for_later_params)
    if !@saved_for_later.save
      flash[:alert] = "You already saved this story for later"
    end
    @post = Post.find_by(id: @saved_for_later.post_id)
    redirect_to post_path(@post)
  end

  def destroy
    @saved_for_later = current_user.saved_for_laters.find(params[:id])
    @saved_for_later.destroy
    redirect_to post_path(@saved_for_later.post)
  end

  def saved_for_later_params
    params.require(:saved_for_later).permit(:post_id)
  end
end
