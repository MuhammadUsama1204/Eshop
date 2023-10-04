class CartsController < ApplicationController
	def add_to_cart	
		@product = Product.find(params[:product_id])
		@line_item = @cart.line_items.find_or_initialize_by(product: @product)
		@line_item.price = @product.price
		if @line_item.persisted?
			@line_item.increment(:quantity)
		else
			@line_item.quantity = 1
		end
	
		if @line_item.save
			redirect_to products_path, notice: "#{@product.title} added to cart."
		else
			render :products_path, notice: "#{@product.title} failed to add to cart."
		end
	end
end
