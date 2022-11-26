class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @param_q = params[:q]
    @param_catid = params[:id]

    wildcard_search = "%#{params[:q]}%"
    @products = Product.where("name LIKE ? OR description LIKE ?", wildcard_search, wildcard_search).page(params[:page])
  end
end
