class OrdersController < ApplicationController
  def index
  end

  def new 
    @order = Order.new
    @order.user = current_user 
    @order.cart = current_user.cart 
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

end
