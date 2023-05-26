class RemixesController < ApplicationController
  def create
    skip_authorization
    @remix = Remix.new(remix_params)
    @remix.user = current_user  # assuming you have a current_user method available
    @remix.audio.attach(params[:audio])

    if @remix.save
      render json: { message: 'Audio file saved successfully' }, status: :ok
    else
      alert('Something went wrong')
      render json: { errors: @remix.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @remix = Remix.find(params[:id])
    send_file @remix.audio.path,
              type: @remix.audio.content_type,
              disposition: "attachment"
  end


  private

  def remix_params
    params.require(:remix).permit(:post_id, :language)
  end
end
