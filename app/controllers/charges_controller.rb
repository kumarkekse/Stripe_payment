class ChargesController < ApplicationController
  
  def create
    @amount = params[:amount]
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::PaymentIntent.create({
      amount: @amount,
      currency: 'usd',
      payment_method_types: ['card'],
      payment_method: 'pm_card_visa',
      description: 'My Test Payment Intent',
      confirm: true
    })

    payment_intent =  Stripe::PaymentIntent.retrieve(charge.id)

    if payment_intent.status == 'requires_action' && payment_intent.next_action.type == 'use_stripe_sdk'
      # Redirect the customer to complete the 3D Secure authentication flow using Stripe.js
      redirect_to payment_intent.next_action.use_stripe_sdk.stripe_js, allow_other_host: true
    else
      # The payment is ready to be confirmed, so confirm it
      payment_intent.confirm
      # Do something else, like redirect to a success page
    end

    intent = Stripe::PaymentIntent.update(payment_intent.id, {metadata: {user_id: '6735'}},)
    
    Stripe::PaymentIntent.confirm(intent.id, {payment_method: 'pm_card_visa'})
    Customer.create(stripe_customer_id: customer.id, stripe_payment_method_id: payment_intent.payment_method)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end