class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.where('quantity_in_stock > 0')
    render json: @products, status: 200
  end
end
