class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all

    @cart = session[:shopping_cart]
  end

  def search
    @param_q = params[:q]
    @param_catid = params[:id]
    @categories = Category.all
    wildcard_search = "%#{params[:q]}%"
    category_id = "#{params[:id]}"

    if (category_id == "")
      @products = Product.where("name LIKE ? OR description LIKE ?", wildcard_search, wildcard_search).page(params[:page])
    else
      @products = Product.where("name LIKE ? OR description LIKE ?", wildcard_search, wildcard_search).where(categories: category_id).page(params[:page])
    end
  end
end
