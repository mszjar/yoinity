class RemixesController < ApplicationController

  def create
    skip_authorization
    @remix = Remix.new(remix_params)
    @remix.user = current_user
    if params[:audio]
      @remix.audio.attach(params[:audio])
    end

    if @remix.save
      render json: { message: 'Audio file saved successfully' }, status: :ok
    else
      render json: { errors: @remix.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # def show
  #   skip_authorization
  #   @remix = Remix.find(params[:id])

  #   if @remix.audio.attached?
  #     send_file @remix.audio.path,
  #               type: @remix.audio.content_type,
  #               disposition: "attachment"
  #   else
  #     flash[:alert] = 'No audio file attached to this remix.'
  #     redirect_to remixes_path
  #   end
  # end

  def show
    skip_authorization
    @remix = Remix.find(params[:id])

    if @remix.audio.attached?
      redirect_to rails_blob_url(@remix.audio)
    else
      flash[:alert] = 'No audio file attached to this remix.'
      redirect_to remixes_path
    end
  end

  def audio
    skip_authorization
    @remix = Remix.find(params[:id])
    redirect_to rails_blob_url(@remix.audio)
  end


  private

  def remix_params
    params.require(:remix).permit(:post_id, :language, :audio)
  end
end
