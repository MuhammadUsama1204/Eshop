class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new 
    @order = Order.new
    @order.user = current_user 
    @order.cart = current_user.cart 
  end
  
  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path, notice: 'Order was successfully updated.'
    else
      render 'edit'
    end
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

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path, notice: 'Order was successfully destroyed.'
    else
      redirect_to order_path, notice: 'Order cannot destroyed!'
    end
  end

  private 

  def order_params
    params.require(:order).permit(:payment_method, :user_id, :cart_id, :billing_address, :shipping_address)
  end
end
