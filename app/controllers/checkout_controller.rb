class CheckoutController < ApplicationController

  def create
    # Establish a connection with Stripe and then redirect the user to the payment

    # Create the line items object for the payment
    @cart_items = session[:shopping_cart]
    @line_items_dict = []
    @cart_items.each do |item|
      @product = Product.find(item["id"])
      @line_items_dict << {
        price_data: {
          currency: 'cad',
          unit_amount: @product.current_price.to_s.gsub(".", "_").to_i,
          product_data: {
            name: @product.name,
            description: @product.description,
          },
          tax_behavior: 'exclusive',
        },
        quantity: item["quantity"],
      }
    end

    # Create Stripe Session
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
      line_items: [@line_items_dict],
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
    @categories = Category.all
    @session_stripe = Stripe::Checkout::Session.retrieve(params[:session_id])

    # Create a new entry in the orders table
    @order = Order.new
    @order.payment_intent = @session_stripe.payment_intent
    @order.save

    # Create entries in the OrderDetails table
    @cart_items = session[:shopping_cart]
    @cart_items.each do |item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.product_id = item["id"]
      @order_detail.quantity = item["quantity"]
      @order_detail.purchase_unit_price = Product.find(item["id"]).current_price
      @order_detail.save
    end
  end

  def cancel
    @categories = Category.all
  end
end
