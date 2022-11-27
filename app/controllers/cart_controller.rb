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
end
