class EphemeralRemixesController < ApplicationController
  before_action :set_ephemeral_remix, only: [:show, :edit, :update, :destroy]

  def index
    @ephemeral_remixes = policy_scope(EphemeralRemix).order('created_at DESC').select(&:available?)

  end

  def new
    @ephemeral_remix = current_user.ephemeral_remixes.build
    authorize @ephemeral_remix
  end

  def create
    @ephemeral_remix = EphemeralRemix.new(ephemeral_remix_params)
    @ephemeral_remix.user = current_user
    if params[:audio]
      @ephemeral_remix.audio.attach(params[:audio])
    end

    authorize @ephemeral_remix

    if @ephemeral_remix.save
      render json: { next_url: '/' }, status: :created
    else
      render json: { error: "Failed to create ephemeral remix.", errors: @ephemeral_remix.errors.to_hash(true) }, status: :unprocessable_entity
    end
  end


  def destroy
    @ephemeral_remix = EphemeralRemix.find(params[:id])
    authorize @ephemeral_remix
    @ephemeral_remix.destroy

    redirect_to '/remixes', notice: 'Remix was successfully deleted.'
  end

  def audio
    @ephemeral_remix = EphemeralRemix.find(params[:id])
    authorize @ephemeral_remix
    redirect_to @ephemeral_remix.audio.service_url
  end

  def ephemeral_remix_params
    params.require(:ephemeral_remix).permit(:audio, :language, :post_id)
  end

  private

  def set_ephemeral_remix
    @ephemeral_remix = EphemeralRemix.find(params[:id])
  end
end
