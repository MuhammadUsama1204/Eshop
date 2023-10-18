class Api::V1::ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @products = Product.where('quantity_in_stock > 0')
    render json: @products, status: 200
  end
end
