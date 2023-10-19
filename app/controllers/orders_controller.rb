class OrdersController < ApplicationController
  include PaginationCollectionHelper

  before_action :find_order, only: %i[show edit update destroy]

  def index
    @orders = pagination_collection(Order.all, :page, Order::PER_PAGE).order(created_at: :desc)
  end

  def new 
    @order = Order.new
    @order.user = current_user 
    @order.cart = current_user.cart 
  end
  
  def edit; end

  def update
    if @order.update(order_params)
      new_status = params[:status]
      OrderMailer.status_update(@order, new_status).deliver_now
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
      @order.cart.soft_delete
    else
      render 'new'
    end
  end

  def show; end

  def destroy
    if @order.destroy
      redirect_to orders_path, notice: 'Order was successfully destroyed.'
    else
      redirect_to order_path, notice: 'Order cannot destroyed!'
    end
  end
  
  def download_invoice
    @order = Order.find(params[:id])
    pdf = Prawn::Document.new
    pdf.text "Invoice no: #{@order.order_number}"
    pdf.text "STatus: #{@order.status}"
    pdf.text "Name: #{@order.name}"
    pdf.text "email: #{@order.user.email}"
    pdf.text "Billing Address: #{@order.billing_address}"
    pdf.text "Shipping Address: #{@order.shipping_address}"
    pdf.text "Contact No: #{@order.contact_no}"

    send_data(pdf.render, filename: "#{@order.order_number}.pdf", type: "application/pdf")
  end

  private 

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_number, :order_date, :payment_method, :user_id, :cart_id, :billing_address, :shipping_address, :status, :name, :contact_no)
  end
  
end
