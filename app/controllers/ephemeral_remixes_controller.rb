class EphemeralRemixesController < ApplicationController
  before_action :set_ephemeral_remix, only: [:show, :edit, :update, :destroy]

  def index
    @ephemeral_remixes = EphemeralRemix.all.select(&:available?)
  end

  def new
    @ephemeral_remix = current_user.ephemeral_remixes.build
  end

  def create
    @ephemeral_remix = current_user.ephemeral_remixes.build(ephemeral_remix_params)
    if @ephemeral_remix.save
      redirect_to '/', notice: 'Ephemeral remix was successfully created.'
    else
      render :new
    end
  end

  def ephemeral_remix_params
    params.require(:ephemeral_remix).permit(:audio)
  end

  private

  def set_ephemeral_remix
    @ephemeral_remix = EphemeralRemix.find(params[:id])
  end
end
