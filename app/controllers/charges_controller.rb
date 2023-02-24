class ChargesController < ApplicationController
  
  def create
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    pay_intent = Stripe::PaymentIntent.create({
      amount: @amount,
      currency: 'usd',
      payment_method: 'pm_card_visa',
      payment_method_types: ['card']
      },
      description: 'My Test Payment Intent'
    )

    pay_intent.confirm

    update_intent = Stripe::PaymentIntent.update(pay_intent.id, metadata: {user_id: '3435453'})
    intent = Stripe::PaymentIntent.retrieve(update_intent.id)
    # Check if 3D Secure authentication is required
    if intent.next_action && intent.next_action.type == 'use_stripe_sdk'
      # Redirect the customer to the 3D Secure authentication URL
      redirect_to intent.next_action.use_stripe_sdk.stripe_js , allow_other_host: true 
      intent.confirm
    else
      # Confirm the payment intent if no further action is required
      intent.confirm
      # Handle the successful payment
    end
    intent.confirm({
    payment_method: "pm_card_visa"
  })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
