class ChargesController < ApplicationController
  
  def create
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    charge = Stripe::PaymentIntent.create(
      customer: customer.id,
      amount: @amount,
      description: 'customer_payment',
      currency: 'inr'
    )
    
    Stripe::PaymentIntent.retrieve(charge.id)

    Stripe::PaymentIntent.update(charge.id, metadata: {user_id: '3435453'})
  
    Stripe::PaymentIntent.confirm(charge.id, {payment_method: 'pm_card_visa'})

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
