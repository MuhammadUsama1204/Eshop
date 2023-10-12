class Order < ApplicationRecord
  before_create :generate_order_number

  belongs_to :user
  belongs_to :cart

  def generate_order_number
    while true
      self.order_number = "#{Time.current.strftime('%Y%m%d%H%M%S')}#{rand(1000..9999)}"
      break unless Order.exists?(order_number: self.order_number)
    end
  end    
end
