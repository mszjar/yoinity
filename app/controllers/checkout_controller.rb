class CheckoutController < ApplicationController
  skip_after_action :verify_authorized, only: %i[success cancel]

  def create
    skip_authorization

    # Set default_url_options directly in the controller for testing purposes.
    default_url_options[:host] = Rails.env.production? ? 'www.yoinity.com' : 'localhost:3000'

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price: 'price_1NAoLvJmS8EflGBbq7JyVV5P', # replace 'price_id' with the actual id of the Price object
        quantity: 1,
      }],
      mode: 'subscription',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
    )

    respond_to do |format|
      format.js
      format.json { render json: @session, status: :created }
    end
  end

  def success
    skip_authorization
    flash[:notice] = "Your payment was successfully accepted."
    current_user.create_subscription(stripe_subscription_id: params[:session_id])
    redirect_to "/checkout/success"
  end

  def cancel
    skip_authorization
    flash[:notice] = "Your payment was cancelled."
    redirect_to root_path
  end
end
