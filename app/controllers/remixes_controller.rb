class RemixesController < ApplicationController

  def index
    @remixes = policy_scope(Remix).order('created_at DESC')
  end

  def new
    @remix = Remix.new
    authorize @remix
  end

  def create
    @remix = Remix.new(remix_params)
    @remix.user = current_user
    if params[:audio]
      @remix.audio.attach(params[:audio])
    end

    authorize @remix

    if @remix.save
      if @remix.post
        # If the remix is associated with a post, respond with a JSON containing the URL to that post.
        render json: { next_url: post_path(@remix.post.token) }, status: :ok
      else
        # If the remix is not associated with a post, respond with a JSON containing the URL to new post page.
        render json: { next_url: new_post_path(remix_id: @remix.id) }, status: :ok
      end
    else
      puts @remix.errors.inspect
      flash[:alert] = @remix.errors.full_messages.join(", ")
    end
  end


  def show
    @remix = Remix.find(params[:id])
    authorize @remix

    if @remix.audio.attached?
      redirect_to url_for(@remix.audio)
    else
      flash[:alert] = 'No audio file attached to this remix.'
      redirect_to remixes_path
    end
  end

  def audio
    @remix = Remix.find(params[:id])
    authorize @remix
    redirect_to @remix.audio.service_url
  end

  def destroy
    @remix = Remix.find(params[:id])
    authorize @remix
    @remix.destroy

    redirect_to remixes_path, notice: 'Remix was successfully deleted.'
  end


  private

  def remix_params
    params.require(:remix).permit(:post_id, :language, :audio)
  end
end
