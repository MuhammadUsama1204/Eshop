class Order < ApplicationRecord
  before_create :generate_order_number

  belongs_to :user
  belongs_to :cart
  
  attribute :order_date, default: -> { Time.current }
  attribute :status, default: "Confirmed"
  attribute :payment_method, default: "Credit Card"

  def generate_order_number
    while true
      self.order_number = "#{Time.current.strftime('%Y%m%d%H%M%S')}#{rand(1000..9999)}"
      break unless Order.exists?(order_number: self.order_number)
    end
  end    
end
