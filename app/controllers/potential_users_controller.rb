class PotentialUsersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @potential_user = PotentialUser.new(potential_user_params)
    authorize @potential_user

    if @potential_user.save
      reset_session  # This line resets the session.
      session[:potential_user_email] = @potential_user.email
      redirect_to posts_path, notice: 'Thank you for your interest!'
    else
      redirect_to root_path, alert: 'Enter a valid email address'
    end
  end

  private

  def potential_user_params
    params.require(:potential_user).permit(:email)
  end
end
