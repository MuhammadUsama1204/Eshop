class ProductsController < ApplicationController
  before_action :find_product, only: %i[show edit update destroy]

  def index
    @paginate_products = paginate_collection(Product.all, :page, Product::PER_PAGE)
    @products = Product.searchFilter(@paginate_products, params)
  end

  def show; end

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

  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = "Successfully Updated"
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path, notice: "Product was successfully destroyed."
    else
      redirect_to products_path, alert: "Unable to destroy Product."
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :total_quantity, :quantity_in_stock, :display_picture)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
