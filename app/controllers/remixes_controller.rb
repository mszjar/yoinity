class RemixesController < ApplicationController

  def index
    @remixes = policy_scope(Remix).order('created_at DESC')
  end

  def create
    @remix = Remix.new(remix_params)
    @remix.user = current_user
    if params[:audio]
      @remix.audio.attach(params[:audio])
    end

    authorize @remix

    if @remix.save
      render json: { message: 'Audio file saved successfully' }, status: :ok
    else
      render json: { errors: @remix.errors.full_messages }, status: :unprocessable_entity
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


  private

  def remix_params
    params.require(:remix).permit(:post_id, :language, :audio)
  end
end
