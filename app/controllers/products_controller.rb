class ProductsController < ApplicationController

    def new
        @product = Product.new
    end
    def create
        @product = Product.new(product_params)
        if @product.save
            flash[:success] = "Successfully Added"
            redirect_to products_path
        else
            render :new, status: :unprocessable_entity
        end
    private
    def product_params
        params.require(:product).permit(:title, :description, :price, :total_quantity, :quantity_in_stock)

    end
end
