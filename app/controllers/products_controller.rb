class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
    @categories = Category.all
  end

  def show
    current_id = params[:id]
    @product = Product.find(current_id)
    @categories = Category.all
    @cart = session[:shopping_cart]

    if @cart.map { |item| item["id"] }.include?(current_id)
      @already_in_cart = true
      @current_item_quantity = @cart.find { |item| item["id"] == current_id }["quantity"]
    end
  end

  def search
    @param_q = params[:q]
    @param_catid = params[:cat_id]
    @categories = Category.all
    wildcard_search = "%#{params[:q]}%"
    category_id = "#{params[:cat_id]}"

    if (category_id == "")
      @products = Product.where("name LIKE ? OR description LIKE ?", wildcard_search, wildcard_search).page(params[:page])
      @category_name_string = "all categories"
    else
      @category_name_string = "the " + Category.where(id: category_id).pluck(:name).first + " category"
      @products = Product.where("name LIKE ? OR description LIKE ?", wildcard_search, wildcard_search).where(categories: category_id).page(params[:page])
    end
  end
end
