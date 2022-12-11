class CartController < ApplicationController
  def create
    current_id = params[:id]
    @product = Product.find(current_id)
    if session[:shopping_cart].map { |item| item["id"] }.include?(current_id)
      flash[:notice] = "You already added this item at index to your cart. Click View Cart to change the quantity. "
    else
      session[:shopping_cart] << { "id" => params[:id], "quantity" => params[:quantity].to_i }
      flash[:notice] = "#{@product.name} is added to the cart."
      flash[:mobile_notice] = "Added to cart."
    end

    redirect_to product_path(current_id)
  end

  def destroy
    curent_page = params[:current_page]
    current_id = params[:id]
    session[:shopping_cart].delete_if { |item| item["id"] == current_id }
    if curent_page == "products"
      redirect_to product_path(current_id)
      flash[:notice] = "This item is removed from cart."
      flash[:mobile_notice] = "Removed."
    else
      redirect_to cart_index_path()
    end
  end

  def update
    curent_page = params[:current_page]
    current_id = params[:id]
    update_quantity = params[:update_quantity].to_i
    session[:shopping_cart].find { |item| item["id"] == current_id }["quantity"] = update_quantity
    if curent_page == "products"
      redirect_to product_path(current_id)
      flash[:notice] = "This item's quantity has been updated."
      flash[:mobile_notice] = "Quantity updated."
    else
      redirect_to cart_index_path()
    end
  end

  def index
    @categories = Category.all

    @cart = session[:shopping_cart]
    @products = []

    @cart.each do |item|
      @products << Product.find(item["id"])
    end

    @total = 0
    @products.each do |product|
      @total += product.current_price * session[:shopping_cart].find { |item| item["id"] == product.id.to_s }["quantity"]
    end
  end
end
