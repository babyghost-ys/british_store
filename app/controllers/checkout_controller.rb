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

    # Create a new entry in the Customers table
    @customer = Customer.find_or_create_by(
      name: @session_stripe.customer_details.name,
      email: @session_stripe.customer_details.email,
      phone: @session_stripe.customer_details.phone,
      address_line1: @session_stripe.customer_details.address.line1,
      address_line2: @session_stripe.customer_details.address.line2,
      address_city: @session_stripe.customer_details.address.city,
      address_country: @session_stripe.customer_details.address.country,
      address_postal: @session_stripe.customer_details.address.postal_code,)

    # Create a new entry in the orders table
    @order = Order.new
    @order.payment_intent = @session_stripe.payment_intent
    @order.customer_id = @customer.id
    @order.payment_status = @session_stripe.payment_status
    @order.payment_method = @session_stripe.payment_method_types[0]
    @order.amount_total = @session_stripe.amount_total.to_f / 100
    @order.amount_subtotal = @session_stripe.amount_subtotal.to_f / 100
    @order.amount_tax = @session_stripe.total_details.amount_tax.to_f / 100
    @order.stripe_status = @session_stripe.status
    @order.purchase_address_line1 = @session_stripe.customer_details.address.line1
    @order.purchase_address_line2 = @session_stripe.customer_details.address.line2
    @order.purchase_address_city = @session_stripe.customer_details.address.city
    @order.purchase_address_country = @session_stripe.customer_details.address.country
    @order.purchase_address_postal = @session_stripe.customer_details.address.postal_code
    @order.order_status_id = OrderStatus.find_by(name: "paid").id
    @order.save

    # Create entries in the OrderDetails table
    @products = [] # Products list for displaying in the success page
    @cart_items = session[:shopping_cart]
    @cart_items.each do |item|
      @products << Product.find(item["id"])
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
