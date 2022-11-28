class CheckoutController < ApplicationController

  def create
    # Establish a connection with Stripe and then redirect the user to the payment

    # Create Stripe Session
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      line_items: [
        {
          price_data: {
            currency: 'cad',
            unit_amount: 123_4,
            product_data: {
              name: "test",
              description: "product.description",
            },
            tax_behavior: 'exclusive',
          },
          quantity: 1,
        },
        {
          price_data: {
            currency: 'cad',
            unit_amount: 50_01,
            product_data: {
              name: "Another Product",
              description: "test123",
            },
            tax_behavior: 'exclusive',
          },
          quantity: 1,
        },

      ],
      automatic_tax: {
        enabled: true
      },
      mode: 'payment',
      billing_address_collection: 'required',
    )

    # Redirect to the original page
    redirect_to @session.url, allow_other_host: true
  end

  def success

  end

  def cancel

  end
end
