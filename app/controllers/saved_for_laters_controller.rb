class SavedForLatersController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @saved_posts = current_user.saved_posts.includes(:post)
  end

  def create
    @saved_for_later = current_user.saved_for_laters.new(saved_for_later_params)
    @post = Post.find_by(id: @saved_for_later.post_id)
    if @saved_for_later.save
      render :create
    else
      flash.now[:alert] = "You already saved this post for later"
      render turbo_stream: turbo_stream.replace(@post, partial: "posts/post", locals: { post: @post })
    end
  end

  def destroy
    @saved_for_later = current_user.saved_for_laters.find(params[:id])
    @post = @saved_for_later.post
    @saved_for_later.destroy
    render :destroy
  end

  private

  def saved_for_later_params
    params.require(:saved_for_later).permit(:post_id)
  end
end
