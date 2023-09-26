class ProductsController < ApplicationController

  def index
      @products= Product.all
      searchFilter
  end

  def show
      @product = Product.find(params[:id])
  end

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
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Successfully Updated"
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
        if @product.destroy
            redirect_to root_path, notice: "Product was successfully destroyed."
        else
            redirect_to root_path, alert: "Unable to destroy Product."
        end
    end
  private
  def product_params
      params.require(:product).permit(:title, :description, :price, :total_quantity, :quantity_in_stock)
  end

  def searchFilter
    @products = @products.where("title LIKE ?", "%#{params[:search]}%")
    min_price = params[:min_price]
    max_price = params[:max_price]
    @products = Product.where(price: min_price..max_price)
  end

end
