class CartsController < ApplicationController
	before_action :set_cart

	def index
    @carts = Cart.all
  end

	def new
    @cart = Cart.new
  end

	def add_to_cart
		@product = Product.find(params[:product_id])
		@line_item = @cart.line_items.find_or_initialize_by(product: @product)
		if @line_item.persisted?
			@line_item.increment(:quantity)
		else
			@line_item.quantity = 1
		end
	
		if @line_item.save
			redirect_to cart_path(@cart), notice: "#{@product.title} added to cart."
		else
			render :new
		end
	end
		
	private

	def set_cart
    if current_user.cart
      @cart = current_user.cart
    else
      @cart = current_user.create_cart
    end
	end
end
