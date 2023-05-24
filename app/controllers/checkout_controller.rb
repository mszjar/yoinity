class CheckoutController < ApplicationController
  skip_after_action :verify_authorized,  only: %i[success cancel]

  def create
    skip_authorization
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price: 'price_1NAoLvJmS8EflGBbq7JyVV5P', # replace 'price_id' with the actual id of the Price object
        quantity: 1,
      }],
      mode: 'subscription',
      success_url: url_for(controller: 'checkout', action: 'success', only_path: false) + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: url_for(controller: 'checkout', action: 'cancel', only_path: false),
    )

    respond_to do |format|
      format.js
      format.json { render json: @session, status: :created }
    end
  end


  def success
    current_user.create_subscription(stripe_subscription_id: params[:session_id])
  end

  def cancel
  end
end
