class Api::V1::ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.where('quantity_in_stock > 0')
    render json: @products, status: 200
  end

  def show
    @product = Product.find(params[:id])
    if @product
      render json: @product, status: 200
    else
      render json: "Product Not found"
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: 200
    else
      render json: "Product Not created"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: @product, status: 200
    else
      render json: "Product Not Updated"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render json: "Deleted Successfully"
    else
      render json: "Product Not deleted!"
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity_in_stock, :price)
  end

end
