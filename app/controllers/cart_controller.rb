class CartController < ApplicationController
  def create
    current_id = params[:id]
    if session[:shopping_cart].map { |item| item["id"] }.include?(current_id)
      session[:shopping_cart].find { |item| item["id"] == current_id }["quantity"] = 300
      flash[:notice] = "You already added this item at index to your cart. #{session[:shopping_cart]} "
    else
      session[:shopping_cart] << { "id" => params[:id], "quantity" => params[:quantity].to_i }
      flash[:notice] = "#{session[:shopping_cart]} added to cart"
    end

    redirect_to product_path(current_id)
  end

  def destroy
    current_id = params[:id]
    session[:shopping_cart].delete_if { |item| item["id"] == current_id }
    redirect_to cart_index_path()
  end

  def update
    current_id = params[:id]
    update_quantity = params[:update_quantity].to_i
    session[:shopping_cart].find { |item| item["id"] == current_id }["quantity"] = update_quantity
    redirect_to cart_index_path()
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
      @total += product.current_price
    end
  end
end
