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
      OrderMailer.order_confirmation(@order).deliver_now
    else
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private 

  def order_params
    params.require(:order).permit(:payment_method, :user_id, :cart_id, :billing_address, :shipping_address)
  end
end
