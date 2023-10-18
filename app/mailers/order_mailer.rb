class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order Confirmation')
  end

  def status_update(order, new_status)
    @order = order
    mail(to: @order.user.email, subject: 'Your Order Status Updated!')
  end
end
