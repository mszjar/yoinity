class ProfilesController < ApplicationController
  skip_after_action :verify_authorized,  only: %i[show]

  def show
    @user = User.find_by(nickname: params[:nickname].downcase)
  end
end
