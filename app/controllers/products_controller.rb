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
  end
end
